#!/usr/bin/env python3

import yaml

# Script to convert current 'tactical' records into private dns records
# as used in the terraform defined zones in this repository.
# It expects a copy of main.yml and auto_generated_azure_records.yml
# in its directory. Converted records are appended to the destination files.


def transform(records, cname_zone, mappings):
    records_out = {'A': [], 'cname': []}
    if records is None:
        print("No records!")
        return records_out
    for r in records:
        t = r['type']
        r_dest = mappings[r['dest']] if r['dest'] in mappings else r['dest']
        if t.lower() == 'a':
            records_out['A'].append({'name': r['name'].lower(), 'ttl': r['ttl'], 'record': [r_dest.lower()]})
        elif t.lower() == 'cname':
            r_dest = r_dest if r_dest[-1] == '.' else r_dest + cname_zone
            records_out['cname'].append({'name': r['name'].lower(), 'ttl': r['ttl'], 'record': r_dest.lower()})
        else:
            print("Unknown record type: {}".format(r))
    return records_out


def split(records):
    zones_out = {'sandbox': [], 'aat': [], 'perftest': [], 'demo': [], 'ithc': [], 'prod': []}
    zones_filter = ['nonprod']
    for record in records:
        name = record['name']
        if name.rfind('.') == -1:
            zones_out['prod'].append(record)
        else:
            zone = name[name.rindex('.')+1:len(name)]
            if zone in zones_filter:
                continue
            if zone in zones_out:
                record['name'] = name[0:name.rindex('.')]
                zones_out[zone].append(record)
            else:
                zones_out['prod'].append(record)
    return zones_out


reform_records_out = {}
platform_records_out = {}
with open('main.yml') as main_file:
    zones = yaml.full_load(main_file)
    mappings = {'{{ ' + k + ' }}': v for (k, v) in zones.items() if k[0:4] != 'bind'}
    reform_records_out = transform(zones['bind_manual_records'], '.reform.hmcts.net.', mappings)
    platform_records = split(zones['bind_manual_platform_records'])
    for z, recs in platform_records.items():
        cname_zone = '.{}.platform.hmcts.net.'.format(z) if z != 'prod' else '.platform.hmcts.net.'
        platform_records_out[z] = transform(recs, cname_zone, mappings)

with open('auto_generated_azure_records.yml') as autogen_file:
    zones = yaml.full_load(autogen_file)
    autogen_out = transform(zones['bind_azure_auto_generated_records'], '.reform.hmcts.net.', {})
    for t, recs in autogen_out.items():
        reform_records_out[t] += recs

# output reform zone
with open('../environments/prod/reform-hmcts-net.yml', 'a') as reform_file:
    yaml.dump(reform_records_out, reform_file)
# output platform zones
for z in platform_records_out:
    with open('../environments/{}/{}-platform-hmcts-net.yml'.format(z, z), 'a') as platform_file:
        yaml.dump(platform_records_out[z], platform_file)
