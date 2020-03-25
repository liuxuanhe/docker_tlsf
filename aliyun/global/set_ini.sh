#!/usr/bin/env bash
# author: yulinzhihou
# mail: yulinzhihou@gmail.com
# date: 2020-03-25
# comment: 复制配置文件替换到指定目录，并给与相应权限
\cp -rf /etc/gs_ini/*.ini /TLsf/workspace/tlbb/Server/Config && chmod -R 777 /TLsf/workspace && chown -R root:root /TLsf/workspace