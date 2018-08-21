# get terraria server files
FROM ubuntu:18.04 as dist

# install setup script dependencies
RUN apt-get update && apt-get install -y curl unzip

# setup will output server files to /opt/terraria
WORKDIR /usr/src
COPY setup.sh .
RUN chmod +x /usr/src/setup.sh
RUN /usr/src/setup.sh

# gather server dependencies
FROM ubuntu:18.04 as setup

# install s3fs
RUN apt-get update && apt-get install -y s3fs

# copy server files
WORKDIR /opt/terraria
COPY --from=dist /opt/terraria .
RUN chmod +x TerrariaServer*

# copy run script that loads serverconfig.txt
COPY run.sh .
RUN chmod +x run.sh

FROM setup as server
VOLUME ["/etc/terraria", "/usr/terraria/worlds", "/var/log/terraria"]
EXPOSE 7777
ENTRYPOINT ["/opt/terraria/run.sh"]
