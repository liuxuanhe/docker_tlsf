FROM mysql:5.7
MAINTAINER yulinzhihou "yulinzhihou@gmail.com"

# 导入纯净天龙数据库
COPY ./initdb.d/*.sql /docker-entrypoint-initdb.d/

# 安装完成以后，执行以下命令。配置用户名密码相关信息；
RUN /etc/init.d/mysqld start &&\
mysql -e "grant all privileges on *.* to 'root'@'%' identified by '123456' WITH GRANT OPTION;"&&\
mysql -e "grant all privileges on *.* to 'root'@'localhost' identified by '123456' WITH GRANT OPTION ;"

CMD ["mysqld"]