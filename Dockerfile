
FROM public.ecr.aws/ubuntu/ubuntu:22.04_stable

ARG __BUILD_DIR__="/build"
ARG __USER__="root"
ARG __WORK_DIR__="/root"

ENV \
    LANG="C.UTF-8" \
    LC_ALL="C.UTF-8"

USER ${__USER__}

COPY "./" "${__WORK_DIR__}/"

RUN mkdir -p "${__WORK_DIR__}/" "${__BUILD_DIR__}/"

# Download specified packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl perl && \
    cd "${__WORK_DIR__}/" && \
    curl --connect-timeout 5 --retry-delay 0 --max-time 15 -Lo listing.htm https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/ && \
    perl rpm_list.pl install.log listing.htm exclusions.txt > packages.txt && \
    cat packages.txt | xargs -I{} curl --connect-timeout 5 --retry-delay 0 --max-time 15 -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/{}

# Second stage of Dockerfile
FROM ghcr.io/uyjulian/rhl_6_2_container:latest

ARG __WORK_DIR__="/root"
ARG __BUILD_DIR__="/build"

RUN mkdir -p "${__BUILD_DIR__}/"
COPY --from=0 "${__WORK_DIR__}" "${__WORK_DIR__}"
RUN mkdir -p "${__BUILD_DIR__}/"/var/lib/rpm && \
    rpm --root "${__BUILD_DIR__}/" --initdb && \
    mkdir "${__BUILD_DIR__}/"/dev && \
    mkdir "${__BUILD_DIR__}/"/etc && \
    touch "${__BUILD_DIR__}/"/etc/ld.so.conf && \
    cd "${__WORK_DIR__}" && \
    cat packages.txt | sort | xargs rpm --verbose --root "${__BUILD_DIR__}/" --install --ignorearch

# Third stage of Dockerfile
FROM scratch

ARG __BUILD_DIR__="/build"

COPY --from=1 "${__BUILD_DIR__}" "/"

ENV \
    LANG="C.UTF-8" \
    LC_ALL="C.UTF-8"

LABEL \
    org.opencontainers.image.source="https://github.com/uyjulian/rhl_6_2_container" \
    maintainer="Julian Uy <https://uyjulian.github.io/>" \
    vendor="uyjulian" \
    cmd="docker container run --interactive --rm --tty ghcr.io/uyjulian/rhl_6_2_container:latest" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.name="ghcr.io/uyjulian/rhl_6_2_container" \
    org.label-schema.description="Red Hat Linux 6.2 Container" \
    org.label-schema.url="https://uyjulian.github.io/" \
    org.label-schema.vcs-url="https://github.com/uyjulian/rhl_6_2_container" \
    org.label-schema.vendor="uyjulian" \
    org.label-schema.version="6.2" \
    org.label-schema.docker.cmd="docker container run --interactive --rm --tty ghcr.io/uyjulian/rhl_6_2_container:latest" \
    org.label-schema.docker.cmd.test="docker container run --interactive --rm --tty ghcr.io/uyjulian/rhl_6_2_container:latest /bin/true"

CMD ["/bin/bash"]
