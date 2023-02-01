FROM alpine:latest

COPY ./content /workdir/

RUN apk add --no-cache curl runit caddy jq tor wget \
    && chmod +x /workdir/service/*/run /workdir/*.sh \
    && /workdir/install.sh \
    && ln -s /workdir/service/* /etc/service/

ENV PORT=80
ENV VmessUUID=757fd8db-c374-445d-9691-acf08f27fe0d
ENV SecretPATH=/757fd8db-c374-445d-9691-acf08f27fe0d
ENV PASSWORD=757fd8db-c374-445d-9691-acf08f27fe0d

EXPOSE 80

ENTRYPOINT ["runsvdir", "-P", "/etc/service"]
