#/bin/bash
LOGIN="YOUR_LOGIN"
PASSWORD="YOUR_PASSWORD"
f_secs=`wget -q --header="accept-encoding: gzip" -O - https://skinny.co.nz/ |grep sec|grep input|cut -d\" -f8`
IFS=' ' read -ra f_sec <<< "$f_secs"
curl -s -X POST --data "mobile=$LOGIN&password=$PASSWORD&login=1&sec_old=${f_sec[0]}&sec=${f_sec[1]}" https://skinny.co.nz/2341_EN.htm |grep 'Credit remaining\|Calls'| sed 's/<tr>/\n/g' | sed 's/<\/td><td>/ /g' | sed 's/<[^>]\+>//g' | sed 's/^[ \t]*//g'
