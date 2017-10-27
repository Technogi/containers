FROM mongo:3.4
ADD scripts /etc/scripts
COPY conf/hugepages /etc/init.d/disable-transparent-hugepages
RUN ls /etc/scripts

RUN chmod +x /etc/scripts/*
RUN chmod 755 /etc/init.d/disable-transparent-hugepages
RUN update-rc.d disable-transparent-hugepages defaults


