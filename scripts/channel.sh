#!/usr/bin/env bash
#
# Copyright (C) 2019 PixysOS project.
#
# Licensed under the General Public License.
# This program is free software; you can redistribute it and/or modify
# in the hope that it will be useful, but WITHOUT ANY WARRANTY;
#
#
# PixysOS ROM building script.

function TG() {
   curl -s "https://api.telegram.org/bot${bottoken}/sendmessage" --data "text=${*}&chat_id=-1001322414571&parse_mode=Markdown" > /dev/null
}

function extras() {
   part1="\u003Ca href\u003D\x22"
   part2="\x22\u003E"
   part3="\u003C\u002Fa\u003E"
}

function build() {
   # Get information from build.json
   fname=$(jq -r '.response.filename' <<< ${B_JSON})
   md5=$(jq -r '.response.id' <<< ${B_JSON})
   url=$(jq -r '.response.url' <<< ${B_JSON})
   
   # Get information from devices.json
   name=$(jq -r '.response.filename' <<< ${D_JSON})
   murl=$(jq -r '.response.filename' <<< ${D_JSON})
   mname=$(jq -r '.response.filename' <<< ${D_JSON})
}
function post() {
   msg=$(mktemp)
   {
      echo -e "New PixysOS Update on $(date)"
      echo
      echo -e "⬇️ Download"
      echo -e "${part1}${url}${part2}${fname}${part3}"
      echo
      echo -e "   📱Device: ${name}"
      echo -e "   ⚡️Build Version: v2.4"
      echo -e "   ⚡️MD5: ${md5}"
      echo
      echo -e "By: ${part1}${murl}${part2}${mname}${part3}"
      echo
      echo -e "Join👉 ${part1}@PixysOS${part2}https://t.me/PixysOS${part3} | ${part1}@PixysOS_chat${part2}https://t.me/PixysOS_chat${part3}"
   } > "${msg}"
   
   MESSEGE=$(cat ${msg})
   TG "${MESSEGE}"
   }
   
 
