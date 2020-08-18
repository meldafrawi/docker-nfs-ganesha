docker-nfs-ganesha
=====================

[![Microbadger Size](https://images.microbadger.com/badges/image/longhornio/nfs-ganesha.svg?maxAge=8600)][microbadger]
[![Docker Pulls](https://img.shields.io/docker/pulls/longhornio/nfs-ganesha.svg?maxAge=8600)][hub]

[microbadger]: https://microbadger.com/images/longhornio/nfs-ganesha
[hub]: https://hub.docker.com/r/longhornio/nfs-ganesha/

Docker image providing [NFS-Ganesha](http://nfs-ganesha.github.io/), a user space NFS v3/v4 fileserver.

## Usage

```bash
$ sudo docker run -d --privileged --name nfs longhornio/nfs-ganesha:latest
```

Mount the NFS export:

```bash
$ mkdir -p /mnt/nfs
$ sudo mount -t nfs4 <server-name>:/ /mnt/nfs`
```

## Environment Variables

#### `NFS_DISK_IMAGE_SIZE_MB`
Default: 1024
Default size of disk image

#### `NFS_DISK_IMAGE_PATH`
Default: /var/nfs-data
Path to create disk image


##### `EXPORT_PATH`
Default: `/data/nfs`
The directory to export.

##### `PSEUDO_PATH`
Default: `/`
NFS4 pseudo path.

##### `EXPORT_ID`
Default: `0`
An identifier for the export, between 0 and 65535.

##### `PROTOCOLS`
Default: `4`
The NFS protocols allowed. One or multiple (comma-seperated) of 3, 4, and 9P.

##### `TRANSPORTS`
Default: `UDP, TCP`
The transport protocols allowed. One or multiple (comma-seperated) of UDP, TCP, and RDMA.

##### `SQUASH_MODE`
Default: `No_Root_Squash`
What kind of user id squashing is performed. No_Root_Squash, Root_Id_Squash, Root_Squash, All_Squash.

##### `GRACELESS`
Default: `true`
Whether to disable the NFSv4 grace period.

##### `VERBOSITY`
Default: `NIV_EVENT`
Logging verbosity. One of NIV_DEBUG, NIV_EVENT, NIV_WARN.
