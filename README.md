# Internal DNS

Azure Private DNS terraform module for deployment of internal DNS zones


# Creating New DNS Zones

To create a new DNS zone add a new terraform definition to the components in the target environment
and add the related data to a zone file in the environments dir. The existing sandbox zones can be used 
as an example.


# Importing existing Consul records

After creating the Private DNS zones, you can run the `consul_records.py` script to import existing Consul 
A and CNAME records. The script invocation syntax is as follows:

```
consul_records.py -c <client> -p <secret> -s <subscription> -d <domain> -r <resource_group> -z <zone> <consul_dns_servers...> 
```   

where:

- `client`: Service Principal client id
- `secret`: Service Principal client secret
- `subscription`: Subscription Id for the target Private DNS zone 
- `domain`: DNS domain
- `zone`: Private DNS zone
- `resource_group`: Resource Group for the Private DNS zone
- `consul_dns_servers`: Space-separated list of Consul servers that serve the domain 
