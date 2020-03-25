#!/usr/bin/env bash
# author: yulinzhihou
# mail: yulinzhihou@gmail.com
# date: 2020-03-25
# comment: 删除数据
docker stop aliyun_server_1 && \
docker rm aliyun_server_1 && \
docker stop aliyun_webdb_1 && \
docker rm aliyun_webdb_1 && \
docker stop aliyun_tlbbdb_1 && \
docker rm aliyun_tlbbdb_1 && \
rm -rf /TLsf/workspace/tlbb