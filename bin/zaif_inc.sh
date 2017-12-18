# required:
# ZAIF_API_KEY
# ZAIF_API_SECRET

sign(){
  echo -n "$1" | openssl dgst -sha512 -hmac "$ZAIF_API_SECRET"
}

export _date="date"
if [ "$(uname)" = "Darwin" ];then
   _date=gdate
fi

# http://techbureau-api-document.readthedocs.io/ja/latest/trade/index.html
# old: https://corp.zaif.jp/api-docs/trade-api/
zaif_secure_curl(){
   _baseUrl="https://api.zaif.jp/tapi"
   nonce=$("$_date" "+%s.%3N")
   url="$_baseUrl"
   params="nonce=$nonce&$1"
   signature=$(sign "$params")
   curl -X POST -H "sign:$signature" -H "key:$ZAIF_API_KEY" --data-ascii "$params" "$url" 2>/dev/null
   
}


# http://techbureau-api-document.readthedocs.io/ja/latest/index.html
# old: https://corp.zaif.jp/api-docs/
#zaif_public_curl(){
#   _baseUrl="https://api.zaif.jp/api/1"
#
#}

jpy_for(){
  unit=
  txt=$(echo "$1" | tr '[:upper:]' '[:lower:]')
  if [ "$txt" = "jpy" ];then
    unit=1
  else
    unit=$(curl https://api.zaif.jp/api/1/last_price/"$txt"_jpy 2>/dev/null | jq .last_price)
  fi
  echo -n "$unit"
}
# jpy_for ZAIF 50

