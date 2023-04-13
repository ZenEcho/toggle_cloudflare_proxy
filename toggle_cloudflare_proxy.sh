#!/bin/bash
 
# 设置您的 Cloudflare API 密钥和账户 ID
api_key="Cloudflare API 密钥"
account_id="Cloudflare 账户 ID"
 
# 设置 网站域名和DNS记录域名
zone_name="Cloudflare里的网站域名"
record_name="DNS的记录,例如:baidu.com或者tieba.baidu.com"
 
# 获取区域 ID
zone_id=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name=${zone_name}" \
     -H "Authorization: Bearer ${api_key}" \
     -H "Content-Type: application/json" | jq -r '.result[0].id')
 
# 获取 DNS 记录的 ID
record_id=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/${zone_id}/dns_records?type=A&name=${record_name}" \
             -H "Authorization: Bearer ${api_key}" \
             -H "Content-Type: application/json" | jq -r '.result[0].id')
 
# 检查当前的代理状态
current_proxy_status=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/${zone_id}/dns_records/${record_id}" \
     -H "Authorization: Bearer ${api_key}" \
     -H "Content-Type: application/json" | jq -r '.result.proxied')
 
if [[ $current_proxy_status == "true" ]]; then
  # 如果代理状态是已开启，则关闭它
  curl -s -X PATCH "https://api.cloudflare.com/client/v4/zones/${zone_id}/dns_records/${record_id}" \
       -H "Authorization: Bearer ${api_key}" \
       -H "Content-Type: application/json" \
       --data '{"proxied":false}' > /dev/null
  echo "Cloudflare DNS记录的代理状态已关闭。"
else
  # 如果代理状态是已关闭，则开启它
  curl -s -X PATCH "https://api.cloudflare.com/client/v4/zones/${zone_id}/dns_records/${record_id}" \
       -H "Authorization: Bearer ${api_key}" \
       -H "Content-Type: application/json" \
       --data '{"proxied":true}' > /dev/null
  echo "Cloudflare DNS记录的代理状态已启用。"
fi
