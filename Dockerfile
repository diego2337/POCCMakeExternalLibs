# TODO - change image since CentOS8 reached EOL in 2021 (https://techglimpse.com/failed-metadata-repo-appstream-centos-8/)
FROM centos:8
LABEL authors="Diego Silva Cintra <diegosc2337@gmail.com>"

# Change mirrors since CentOS 8 reached EOL in 2021 (https://techglimpse.com/failed-metadata-repo-appstream-centos-8/)
RUN cd /etc/yum.repos.d/ && \
	sed -i -e "s|mirrorlist=|#mirrorlist=|g" -e "s|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g" /etc/yum.repos.d/CentOS-Linux-* && \
	sed -i -e "s|mirrorlist=|#mirrorlist=|g" /etc/yum.repos.d/CentOS-*

# Add files to container
ADD Server/* /workspaces/PocCMakeExternalLibs/Server/
ADD XMLSerializer/* /workspaces/PocCMakeExternalLibs/XMLSerializer/

# Clean and update dnf related libs
RUN dnf clean all && rm -r /var/cache/dnf  && dnf upgrade -y && dnf update -y && \
	dnf install -y dnf-plugins-core && \
	dnf config-manager --set-enabled powertools

# Install utils
RUN	dnf install -y  \
	cyrus-sasl-devel cyrus-sasl-md5 cyrus-sasl-plain nss-devel nspr-devel \
	vim iputils cifs-utils file \
	git subversion \
	unzip-6.0 gzip xz \
	openssl openssl-devel \
	nc telnet nss nss-devel

# Install GCC, ruby, python, valgrind and clang
RUN	dnf install -y \
	gcc gcc-c++ \
	make automake autoconf  libtool \
	apr apr-devel libtool-ltdl libtool-ltdl-devel gnutls \ 
	ruby-devel python2-devel swig \
	libuuid-devel pkgconfig ruby help2man doxygen graphviz \
	libnsl \
	valgrind cppcheck clang-tools-extra git-clang-format \
        gdb \
	python3-pip wget \
	clang-tools-extra git-clang-format

# Install CMake
RUN	dnf remove cmake -y \
	&& pip3 install cmake cmake_format pyyaml

# Install POCO
RUN wget https://github.com/pocoproject/poco/archive/poco-1.10.1-release.tar.gz \
	&& tar -xf poco-1.10.1-release.tar.gz \
	&& cd poco-poco-1.10.1-release/ \
	&& cmake -DENABLE_DATA_MYSQL=OFF -DENABLE_DATA_POSTGRESQL=OFF . \
	&& cmake --build . --config Release \
	&& cmake --build . --target install \
	&& cd .. \
	&& rm -Rf poco*


VOLUME /opt/workspace

CMD ["/bin/bash"]