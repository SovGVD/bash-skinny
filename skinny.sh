#/bin/bash
LOGIN="YOUR_LOGIN"
PASSWORD="YOUR_PASSWORD"
curl -s -b -X POST --location --data "AuthenticationMethod=MemberAuthenticator&Email=$LOGIN&Password=$PASSWORD&LoginType=skinny-mobile&BackURL=dashboard%2F&action_dologin=Log+in" https://www.skinny.co.nz/Security/LoginForm | grep -A 17 'data-title'|grep 'last' | sed 's/ will expire on//g' | sed 's/<br \/>/\n   /g' | sed 's/<\/p>/\n/g' | sed 's/<[^>]\+>//g'
