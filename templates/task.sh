#!/usr/bin/env bash
set -euo pipefail

date=$(date +'%A, %B %d, %Y')
dateUTC=$(date -u +"%Y-%m-%d")
# tomorrowUTC=$(date --date=tomorrow +"%Y-%m-%d")

cat <<EOF
---
title: $date
desctiption: Developer diary
author: Roman Vavilov
date: '$date'
---

#
EOF
