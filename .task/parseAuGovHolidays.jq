.result.records 
  | map(select(any(.; .Jurisdiction == "nsw"))) 
  | map({ 
    name: ."Holiday Name",
    date: ."Raw Date"
      | tonumber |  strftime("%Y%m%d"), id: ._id | tostring })
    | [   foreach .[] as $e (
       0
     ; .+1
     ; $e + {"id":"en-AU\(.)"} )] 
  | map("holiday." + .id + ".name=" + .name + "\nholiday." + .id + ".date=" + .date) 
  | join("\n")



