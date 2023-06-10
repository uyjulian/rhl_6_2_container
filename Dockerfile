
FROM node:16-buster-slim

ARG __BUILD_DIR__="/build"
ARG __USER__="root"
ARG __WORK_DIR__="/root"

ENV \
    LANG="C.UTF-8" \
    LC_ALL="C.UTF-8"

USER ${__USER__}

COPY "./" "${__WORK_DIR__}/"

RUN mkdir -p "${__WORK_DIR__}/" "${__BUILD_DIR__}/"

# Download all base packages except dev and raidtools
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl && \
    cd "${__WORK_DIR__}/" && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/MAKEDEV-2.5.2-1.noarch.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/SysVinit-2.78-5.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/anacron-2.1-6.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/apmd-3.0final-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/ash-0.2-20.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/at-3.1.7-14.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/authconfig-3.0.3-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/basesystem-6.0-4.noarch.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/bash-1.14.7-22.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/bc-1.05a-5.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/bdflush-1.5-11.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/binutils-2.9.5.0.22-6.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/bzip2-0.9.5d-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/chkconfig-1.1.2-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/console-tools-19990829-10.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/cpio-2.4.2-16.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/cracklib-2.7-5.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/cracklib-dicts-2.7-5.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/crontabs-1.7-7.noarch.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/diffutils-2.7-17.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/e2fsprogs-1.18-5.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/ed-0.2-13.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/eject-2.0.2-4.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/etcskel-2.3-1.noarch.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/file-3.28-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/filesystem-1.3.5-1.noarch.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/fileutils-4.0-21.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/findutils-4.1-34.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/gawk-3.0.4-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/gd-1.3-6.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/gdbm-1.8.0-3.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/getty_ps-2.0.7j-9.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/glib-1.2.6-3.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/glibc-2.1.3-15.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/gmp-2.0.2-13.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/gnupg-1.0.1-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/gpm-1.18.1-7.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/grep-2.4-3.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/groff-1.15-8.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/gzip-1.2.4a-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/hdparm-3.6-4.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/info-4.0-5.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/initscripts-5.00-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/isapnptools-1.21b-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/kbdconfig-1.9.2.4-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/kernel-2.2.14-5.0.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/kernel-pcmcia-cs-2.2.14-5.0.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/kernel-smp-2.2.14-5.0.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/kernel-utils-2.2.14-5.0.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/kudzu-0.36-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/ld.so-1.9.5-13.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/ldconfig-1.9.5-16.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/less-346-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/libc-5.3.12-31.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/libstdc++-2.9.0-30.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/libtermcap-2.0.8-20.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/lilo-0.21-15.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/linuxconf-1.17r2-6.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/logrotate-3.3.2-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/losetup-2.10f-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/mailcap-2.0.6-1.noarch.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/mailx-8.1.1-10.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/man-1.5h1-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/mingetty-0.9.4-11.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/mkbootdisk-1.2.5-3.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/mkinitrd-2.4.1-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/mktemp-1.5-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/modutils-2.3.9-6.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/mount-2.10f-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/mouseconfig-4.4-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/mt-st-0.5b-7.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/ncompress-4.2.4-15.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/ncurses-5.0-11.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/net-tools-1.54-4.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/newt-0.50.8-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/ntsysv-1.1.2-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/pam-0.72-6.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/passwd-0.64.1-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/pciutils-2.1.5-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/popt-1.5-0.48.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/procmail-3.14-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/procps-2.0.6-5.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/psmisc-19-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/pump-0.7.8-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/pwdb-0.61-0.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/quota-2.00pre3-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/readline-2.2.1-6.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/redhat-logos-1.1.0-2.noarch.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/redhat-release-6.2-1.noarch.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/rmt-0.4b15-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/rootfiles-5.2-5.noarch.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/rpm-3.0.4-0.48.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/sash-3.4-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/sed-3.02-6.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/sendmail-8.9.3-20.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/setserial-2.15-3.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/setup-2.1.8-1.noarch.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/setuptool-1.2-5.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/sh-utils-2.0-5.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/shadow-utils-19990827-10.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/slang-1.2.2-5.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/slocate-2.1-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/stat-1.5-12.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/sysklogd-1.3.31-16.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/tar-1.13.17-3.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/termcap-10.2.7-9.noarch.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/textutils-2.0a-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/time-1.7-9.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/timeconfig-3.0.3-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/tmpwatch-2.2-1.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/utempter-0.5.2-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/util-linux-2.10f-7.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/vim-common-5.6-11.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/vim-minimal-5.6-11.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/vixie-cron-3.0.1-40.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/which-2.9-2.i386.rpm && \
    curl -LOC - https://legacy.redhat.com/pub/redhat/linux/6.2/en/os/i386/RedHat/RPMS/zlib-1.1.3-6.i386.rpm && \
    true

# Second stage of Dockerfile
FROM ghcr.io/uyjulian/rhl_6_2_container:latest

ARG __WORK_DIR__="/root"
ARG __BUILD_DIR__="/build"

RUN mkdir -p "${__BUILD_DIR__}/"
COPY --from=0 "${__WORK_DIR__}" "${__WORK_DIR__}"
RUN mkdir -p "${__BUILD_DIR__}/"/var/lib/rpm && \
    rpm --root "${__BUILD_DIR__}/" --initdb && \
    cd "${__WORK_DIR__}" && \
    rpm --verbose --root "${__BUILD_DIR__}/" --install --ignorearch *.i386.rpm *.noarch.rpm

# Third stage of Dockerfile
FROM scratch

ARG __BUILD_DIR__="/build"

COPY --from=1 "${__BUILD_DIR__}" "/"

ENV \
    LANG="C.UTF-8" \
    LC_ALL="C.UTF-8"

CMD ["/bin/bash"]
