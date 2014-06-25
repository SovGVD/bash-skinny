#/bin/bash
LOGIN="YOUR_LOGIN"
PASSWORD="YOUR_PASSWORD"
curl -s -b -X POST --location --data "AuthenticationMethod=MemberAuthenticator&Email=$LOGIN&Password=$PASSWORD&BackURL=dashboard/&Remember=&action_dologin=Log%20in" https://www.skinny.co.nz/Security/LoginForm | grep -A 3 'balance_summaries\|balance_title\|amount"><sup>' | sed 's/<\/sup>/\n/g' | sed 's/<\/p>/\n/g' | grep -v '<\|--' | sed -e 's/^[ \t]*//' | sed '/^$/d'
