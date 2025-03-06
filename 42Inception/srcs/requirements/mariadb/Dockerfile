FROM debian:buster
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install mariadb-server mariadb-client -y && \
    mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    chown -R mysql:mysql /etc/mysql/ && \
    chown -R mysql:mysql /var/lib/mysql

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/launch.sh /launch.sh
RUN chmod 777 launch.sh

ENTRYPOINT ["bash",  "/launch.sh"]
