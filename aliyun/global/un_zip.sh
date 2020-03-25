#!/usr/bin/env bash
# author: yulinzhihou
# mail: yulinzhihou@gmail.com
# date: 2020-03-25
# comment: 解压zip文件包到指定的目录，并给相应的权限
sudo yum -y install unzip && unzip tlbb.zip -d /TLsf/workspace && chmod -R 777 /TLsf/workspace && rm -rf ~/tlbb.zip