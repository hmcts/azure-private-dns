#!/usr/bin/env python3

import sys
import getopt
import json
from urllib.request import urlopen

import azure.mgmt.privatedns as private_dns
from azure.mgmt.privatedns.models import ARecord as aRec
from azure.mgmt.privatedns.models import CnameRecord as cRec
from azure.common.credentials import ServicePrincipalCredentials


default_tenant_id = '531ff96d-0ae9-462a-8d2d-bec7c0b42082'


class RecordRegistrationClient(object):
    """Azure Private DNS records registration operations.
        
    """

    def __init__(self, tenant_id, subscription_id, client_id, client_secret):
        self.credentials = ServicePrincipalCredentials(
            tenant=tenant_id, client_id=client_id, secret=client_secret)
        self.dns_client = private_dns.PrivateDnsManagementClient(self.credentials, subscription_id)

    def register_a(self, resource_group_name, private_zone_name, record_set_name, ip_address, ttl="300"):
        a_rec = self.dns_client.record_sets.create_or_update(
            resource_group_name, private_zone_name, 'A', record_set_name,
            {"ttl": ttl, "a_records": [aRec(ipv4_address=ip_address)]})
        print("Registered A: {}".format(a_rec))

    def register_cname(self, resource_group_name, private_zone_name, record_set_name, cname, ttl="300"):
        cname = self.dns_client.record_sets.create_or_update(
            resource_group_name, private_zone_name, 'CNAME', record_set_name,
            {"ttl": ttl, "cname_record": cRec(cname=cname)})
        print("Registered CNAME: {}".format(cname))

    def register_all(self, resource_group_name, private_zone_name, records, ttl="300"):
        i = 0
        j = 0
        for rec_type, rec in records.items():
            if rec_type == 'A':
                for service, address in rec.items():
                    self.register_a(resource_group_name, private_zone_name, service, address, ttl)
                    print("Registering A = {}, {}, {}, {}".format(resource_group_name, private_zone_name, service, address))
                    i += 1
            elif rec_type == 'CNAME':
                for service, address in rec.items():
                    self.register_cname(resource_group_name, private_zone_name, service, address, ttl)
                    print("Registering CNAME = {}, {}, {}, {}".format(resource_group_name, private_zone_name, service, address))
                    j += 1
        print("Loaded {} A recs + {} CNAME recs = {}".format(i, j, i+j))


def load_records(servers):
    a_records = {}
    cname_records = {}
    for server in servers:
        with urlopen("http://{}:{}//v1/agent/services".format(server, 8500), timeout=120) as response:
            data_json = json.load(response)
            for k, v in data_json.items():
                if not v['Tags'] or 'A' in v['Tags']:
                    a_records[v['Service']] = v['Address']
                elif 'CNAME' in v['Tags']:
                    cname_records[v['Service']] = v['Address']
    return {'A': a_records, 'CNAME': cname_records}


def main(argv):
    """Script to import existing Consul A and CNAME records into an Azure Private DNS Zone.

    Args:
        -c <client-id> (str): Service Principal client id
        -p <client-secret>: Service Principal client secret
        -s <subscription>: Subscription Id for the target Private DNS zone
        -d <domain>: DNS domain
        -z <zone>: Private DNS zone
        -r <resource_group>: Resource Group for the Private DNS zone
        <consul_dns_servers>: Space-separated list of Consul servers that serve the domain (use all 3 consul servers, they could be out of sync)
    """
    usage = """consul_records.py -c <client-id> -p <client-secret> -s <subscription> -d <domain> -r <resource_group> -z <zone> <consul_dns_servers...>

    Args:
        -c <client-id>: Service Principal client id
        -p <client-secret>: Service Principal client secret
        -s <subscription>: Subscription Id for the target Private DNS zone
        -d <domain>: DNS domain
        -z <zone>: Private DNS zone
        -r <resource_group>: Resource Group for the Private DNS zone
        <consul_dns_servers>: Space-separated list of Consul servers that serve the domain (use all 3 consul servers, they could be out of sync)     

    """
    client, secret, subscription, domain, resource_group, zone = [None, None, None, None, None, None]
    servers = []
    try:
        opts, args = getopt.getopt(
            argv, "hc:p:s:d:r:z:", ["client=", "secret=", "subscription=", "domain=", "resource_group=", "zone="])
    except getopt.GetoptError:
        print(usage)
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print(usage)
            sys.exit()
        elif opt in ("-c", "--client"):
            client = arg
        elif opt in ("-p", "--secret"):
            secret = arg
        elif opt in ("-s", "--subscription"):
            subscription = arg
        elif opt in ("-d", "--domain"):
            domain = arg
        elif opt in ("-r", "--resource-group"):
            resource_group = arg
        elif opt in ("-z", "--zone"):
            zone = arg
    for arg in args:
        servers.append(arg)

    print("client={}, subscription={}, domain={}, resource_group={}, zone={}, servers={}".format(
        client, subscription, domain, resource_group, zone, ",".join(servers)))

    if not client or not secret or not subscription or not domain or not resource_group or not zone:
        print(usage)
        sys.exit(2)

    registration_client = RecordRegistrationClient(default_tenant_id, subscription, client, secret)
    records = load_records(servers)
    print("Loaded {} A records + {} CNAME records from source.".format(len(records['A']), len(records['CNAME'])))
    registration_client.register_all(resource_group, zone, records)


if __name__ == "__main__":
    main(sys.argv[1:])
