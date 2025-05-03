#!/bin/bash
#MSG|PRGC|PRGT|PRGV|DRV|TCOUNT|CINFO|TINFO|SINFO
# Convert every line of mkmkv output to a json array
sed -r "s/^(MSG|PRGC|PRGT|PRGV|DRV|TCOUNT|CINFO|TINFO|SINFO):(.*)$/\[\"\1\",\2\]/" |
# collect all lines in an array with --slurp
 jq -sc |
# jq 'map(select(.[0]=="TINFO" or .[0]=="CINFO"))' |
# group by msg type
 jq 'group_by(.[0]) | map({key: .[0][0], value: .}) | from_entries' |
 jq '{
  TCOUNT : .TCOUNT | map({count: .[1]}),
  TINFO : .TINFO | map({title: .[1],id: .[2],code: .[3],value: .[4]}) | group_by(.title) | map ({key: .[0].title | tostring,value: map({key: .id | tostring,value:.value}) | from_entries}) | from_entries,
  SINFO : .SINFO | map({title: .[1],track: .[2],id: .[3],code: .[4],value: .[5]}) | group_by(.title) | map ({key: .[0].title | tostring,value: map({key: .id | tostring,value:.value}) | from_entries}) | from_entries,
  CINFO : .CINFO | map({id: .[1],code: .[2],value: .[3]}) | map({key: .id | tostring,value:.value}) | from_entries,
}
' |
 jq '{
  meta: {titlecount: .TCOUNT[0].count, disctype: .CINFO.["1"], name: .CINFO.["2"], volumename: .CINFO.["32"],},
  titles: .TINFO | map({chaptercount: .["8"],duration: .["9"],size: .["11"], originaltitle: .["24"], segmentcount: .["25"], segmentmap: .["26"], comment: .["49"]}),
 }' |
# jq 'group_by(.[1]) | map({key: (.[0][1] | tostring), value: [.[]]})' |
# jq '.'
 jq
