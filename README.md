# Internal DNS

Azure Private DNS terraform module for deployment of internal DNS zones


# Creating New DNS Zones

To create a new DNS zone add a new terraform definition to the components in the target environment
and add the related data to a zone file in the environments dir. The existing sandbox zones can be used 
as an example.


# Importing existing Consul records

After creating the Private DNS zones, you can run the `./consul_records.py` script to import existing Consul (in the scripts directory).
A and CNAME records. Run `./consul_records.py` with no arguments to see the options
