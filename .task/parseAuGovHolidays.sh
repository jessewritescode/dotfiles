 curl 'https://data.gov.au/data/api/3/action/datastore_search?resource_id=bda4d4f2-7fde-4bfc-8a23-a6eefc8cef80' | jq -rf parseAuGovHolidays.jq > holidays_AU

