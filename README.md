# Terraria Dedicated Server

Install Docker REX-Ray S3FS plugin:

```bash
docker plugin install rexray/s3fs \
  S3FS_ACCESSKEY=XXXXXX \
  S3FS_SECRETKEY=XXXXXX
```

Run container using existing S3 bucket:

```bash
docker run -it --name terraria \
  -p 7777:7777 \
  -v worldsbucket:/etc/terraria:rw \
  -v worldsbucket:/usr/terraria/worlds:rw \
  -v worldsbucket:/var/log/terraria:rw \
  fostertheweb/terraria
```
