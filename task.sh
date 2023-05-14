#!/bin/bash
docker-compose run ora2pg 
# docker-compose run pgsql psql -h192.168.0.76 -p25433 -UMuyuanWaterFactoryApp -w  -f /pgsql/import_equip_bill.sql
# docker-compose run pgsql psql -h192.168.0.76 -p25433 -UMuyuanWaterFactoryApp -w  -f /pgsql/import_equip_bill_residential.sql


docker-compose run pgsql psql -h172.18.135.91 -p25433 -UMuyuanWaterFactoryApp -w  -f /pgsql/import_equip_bill.sql
docker-compose run pgsql psql -h172.18.135.91 -p25433 -UMuyuanWaterFactoryApp -w  -f /pgsql/import_equip_bill_residential.sql