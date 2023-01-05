FROM quay.io/centos/centos:stream8

RUN dnf upgrade --refresh -y && \
    curl https://binaries.twingate.com/client/linux/install.sh | bash && \
    dnf install iproute -y

ENTRYPOINT [ "twingate", "start" ]
CMD ["tail", "-f", "/dev/null"]

