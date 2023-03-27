#!/bin/bash

while IFS="," read -r title adress postcode website draft stage
do
	documentnaam=$(echo $title | tr ' ' '-')
	documentnaam=${documentnaam//ś/s}
	documentnaam=${documentnaam//./}
	documentnaam=${documentnaam//é/e}
	documentnaam=${documentnaam//de-/}
	documentnaam=${documentnaam//De-/}

	cat > "${documentnaam,,}.md" <<EOF
---
title: $title
date: 2021-01-01T00:00:00+0200
logo: "images/leden/logo_${documentnaam,,}.jpg"
icon: "images/leden/icon_${documentnaam,,}.jpg"
address: $adress
postcode: $postcode
website: $website
stageplek: ${stage,,}
draft: ${draft,,}
---

EOF
done < <(tail -n +2 leden.csv)
