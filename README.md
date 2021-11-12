[![Build Status](https://img.shields.io/docker/cloud/build/spielhuus/elektrophon)](https://hub.docker.com/repository/docker/spielhuus/elektrophon)
[![GitHub version](https://img.shields.io/docker/pulls/spielhuus/elektrophon.svg)](https://hub.docker.com/repository/docker/spielhuus/elektrophon)

# docker-elektrophon
Docker build image for elekrophon

## download the docker image from dockerhub

```
docker pull ghcr.io/spielhuus/docker-elektrophon:main
```

## generate the pages

```
docker run -v {PATH TO CONTENT}:/github/workspace -ti --rm ghcr.io/spielhuus/docker-elektrophon:main build
```

## serve the blog locally

```
docker run -v {PATH TO CONTENT}:/github/workspace -p 1313:1313 -ti --rm ghcr.io/spielhuus/docker-elektrophon:main serve
```

## clean the local repository

```
docker run -v {PATH TO CONTENT}:/github/workspace -ti --rm ghcr.io/spielhuus/docker-elektrophon:main clean
```

## run jupyterlab

```
docker run -v {PATH TO CONTENT}:/github/workspace -p 8888:8888 -ti --rm ghcr.io/spielhuus/docker-elektrophon:main notebook
```

## Credits:

* https://docker.io
* https://gohugo.io/
* https://jupyter.org/

## License

[Boost Software License](http://www.boost.org/LICENSE_1_0.txt) - Version 1.0 - August 17th, 2003


