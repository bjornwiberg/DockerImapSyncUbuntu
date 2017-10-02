# ======================================================================
# Dockerfile for building an imapsync docker image from Ubuntu 16.04 
# ======================================================================

# ======================================================================
# run in same folder as this file
# docker build -t imapsync .
# ======================================================================

# ======================================================================
# After build run
# docker run -it imapsync
# ======================================================================

# ======================================================================
# inside container run
# imapsync \
#    --host1 host1 --user1 user1 --password1 password1 \
#    --host2 host2 --user2 user2 --password2 password2
# replace host, user and password
# ======================================================================

FROM ubuntu:16.04

LABEL maintainer "Björn Wiberg | b@bjrn.nu | bjrn.nu"

RUN apt-get update \
    && apt-get install -y \
    makepasswd \
    rcs \
    perl-doc \
    libio-tee-perl \
    git \
    libmail-imapclient-perl \
    libdigest-md5-file-perl \
    libterm-readkey-perl \
    libfile-copy-recursive-perl \
    build-essential \
    make \
    automake \
    libunicode-string-perl \
    libauthen-ntlm-perl \
    libcrypt-ssleay-perl \
    libdigest-hmac-perl \
    libfile-copy-recursive-perl \
    libio-compress-perl \
    libio-socket-inet6-perl \
    libio-socket-ssl-perl \
    libio-tee-perl \
    libmodule-scandeps-perl \
    libnet-ssleay-perl \
    libpar-packer-perl \
    libreadonly-perl \
    libterm-readkey-perl \
    libtest-pod-perl \
    libtest-simple-perl \
    libunicode-string-perl \
    liburi-perl \
    cpanminus \
    libssl-dev

RUN cpanm \
    JSON::WebToken \
    Test::MockObject \
    Unicode::String Data::Uniqid \
    Crypt::OpenSSL::RSA \
    Dist::CheckConflicts \
    JSON::WebToken::Crypt::RSA Sys::MemInfo

RUN git clone git://github.com/imapsync/imapsync.git \
    && cd imapsync \
    && make install

CMD ["/bin/bash"]

# End of Dockerfile
