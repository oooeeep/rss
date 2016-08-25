FROM alpine

RUN set -ex \
    && apk add --no-cache libsodium py-pip \
    && pip --no-cache-dir install https://raw.githubusercontent.com/CM44/cdn/master/add/rss.zip

ENV KEY key
CMD /usr/bin/ssserver -p 8080 -k $KEY -m chacha20 -o http_simple_compatible -P auth_sha1_compatible
