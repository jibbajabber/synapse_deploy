Deploying a Synapse Chat Server
==============

This repo will stand up a synapse matrix server using either docker or vagrant

### How to deploy

#### Vagrant

```
vagrant up
vagrant ssh
mkdir /vagrant/data
cd /vagrant/data
synctl start
 ```
 
 #### Docker
 NOTE: update /path/to/this/repo with the absolute local path to this repo
 This will create a data directory with all the synapse persistent data
 ```
 docker build -t synapse:0.1 .
 docker run --user `id -u`:`id -g` -p 8008:8008 -v "/path/to/this/repo/:/opt/synapse" --name synapse -d synapse:0.1
```


### Add New Synapse Users

#### Docker
```
docker exec -it synapse bash
cd data
register_new_matrix_user -c homeserver.yaml
```

#### Vagrant
```
vagrant ssh
cd /vagrant/data
register_new_matrix_user -c homeserver.yaml
```
