#!/usr/bin/env bash
# author: yulinzhihou
# mail: yulinzhihou@gmail.com
# date: 2020-03-25
# comment: 一键开服，适合于那种可以一键开启的服务端，如果3-5分钟后，服务端没开启，则需要使用分步开服方式
cd ~/.tlsf/aliyun && docker-compose exec -d server /home/billing/billing \& && sed -i 's/exit$/sleep 99999999/g' /TLsf/workspace/tlbb/run.sh && cd ~/.tlsf/aliyun && docker-compose exec -d server /bin/bash run.sh