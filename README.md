[![Build](https://github.com/emazzotta/docker-terraform/actions/workflows/build.yml/badge.svg)](https://github.com/emazzotta/docker-terraform/actions/workflows/build.yml)
[![License](http://img.shields.io/:license-mit-blue.svg?style=flat)](https://emanuelemazzotta.com/mit-license)

# Docker Terraform

Simple terraform docker container.

Contains some packages, see [Dockerfile](./Dockerfile)

## Usage

```bash
docker run -ti --rm -v $PWD:/src -w /src emazzotta/docker-terraform
```

## Author

[Emanuele Mazzotta](mailto:hello@mazzotta.me)
