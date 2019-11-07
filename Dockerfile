FROM maven:3-jdk-11

ENV BASE_GUS=/tmp/base_gus
ENV GUS_HOME="${BASE_GUS}/gus_home"
ENV PROJECT_HOME="${BASE_GUS}/project_home"
ENV PATH="${GUS_HOME}/bin:${PROJECT_HOME}/install/bin:${PATH}"
ENV PATH="${GUS_HOME}/bin:${PATH}"

# install ant
ENV ANT_VERSION 1.10.6
RUN cd ~ && \
    wget -q http://www.us.apache.org/dist/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz && \
    tar -xzf apache-ant-${ANT_VERSION}-bin.tar.gz && \
    mv apache-ant-${ANT_VERSION} /opt/ant && \
    rm apache-ant-${ANT_VERSION}-bin.tar.gz
ENV ANT_HOME /opt/ant
ENV PATH ${PATH}:/opt/ant/bin

# will assume that /tmp/base_gus is populated by volume mounts during build
