FROM mysql:5.7

COPY ./initdb.d/*.sql /docker-entrypoint-initdb.d/

CMD ["mysqld"]

EXPOSE  3306:33061