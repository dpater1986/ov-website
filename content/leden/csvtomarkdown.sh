#!/bin/bash

while IFS="," read -r title name adress postcode email phone draft
do
	documentname=$(echo $title | tr ' ' '-')
	cat > "${documentname,,}.md" <<EOF
---
title: $title
date: 2021-01-01T00:00:00+0200
address: $adress
postcode: $postcode
email: $email
phone: $phone
website: $website
draft: ${draft,,}
---

EOF
done < <(tail -n +2 leden.csv)
