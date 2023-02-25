#!/bin/bash

while IFS="," read -r title name adress postcode email website phone draft
do
	documentnaam=$(echo $title | tr ' ' '-')
	documentnaam=${documentnaam//ś/s}
	documentnaam=${documentnaam//./}
	documentnaam=${documentnaam//é/e}

	cat > "${documentnaam,,}.md" <<EOF
---
title: $title
date: 2021-01-01T00:00:00+0200
logo: "images/leden/logo_${documentnaam,,}.jpg"
icon: "images/leden/icon_${documentnaam,,}.jpg"
address: $adress
postcode: $postcode
email: $email
phone: $phone
website: $website
stageplek: false
draft: ${draft,,}
---

EOF
done < <(tail -n +2 leden.csv)
