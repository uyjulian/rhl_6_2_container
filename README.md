# Red Hat 6.2 Container

The base installation of Red Hat 6.2 in a container, usable with Podman and Docker.  

## Usage

```bash
podman run -it ghcr.io/uyjulian/rhl_6_2_container:latest
```

## Building

```bash
podman build .
```

## Changing the package configuration

The `install.log` file in this repository can be replaced with `/tmp/install.log` from a fresh Red Hat Linux installation.

## License

The files in this repository to build the container are licensed under the MIT license. Please view the `LICENSE` file for more information.  
