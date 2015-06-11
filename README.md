Versions
========

- [`1.0`, `latest` (_Dockerfile_)](https://github.com/markoshust/docker-ubuntu-trusty-magento2-installer/blob/master/Dockerfile)

Description
===========

This image is built from [`markoshust/ubuntu-trusty-lamp`](https://registry.hub.docker.com/u/markoshust/ubuntu-trusty-lamp/) and provides an install script for Magento2.

What's in this image?
=====================

This image installs the most recent versions of the following:

- `apache 2.4`
- `mysql 5.6`
- `php 5.6`
- `curl`
- `git`
- `php5-cli`
- `php5-curl`
- `php5-gd`
- `php5-intl`
- `php5-mcrypt`
- `php5-mhash`
- `sendmail`
- `composer`

It also provides a command line script to install Magento2 with sample data. 

Pull this repostiory
====================

`docker pull markoshust/ubuntu-trusty-magento2-installer`

Usage
=====

```
docker run -i -t --name magento2 -p 8080:80 markoshust/ubuntu-trusty-magento2-installer

./install-magento2.sh
```

When install is complete, you may visit the store at http://192.168.59.103:8080/

By default, a demo store is installed with default sample data.

Feel free to modify `install-magento2.sh` as desired for custom builds.
