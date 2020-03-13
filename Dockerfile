FROM nodeshift/ubi8-s2i-web-app:10.x
LABEL "io.openshift.build.image"="nodeshift/ubi8-s2i-web-app:10.x" "io.openshift.build.source-location"="/tmp/build/inputs"
ENV OPENSHIFT_BUILD_NAME="listas-s2i-22" OPENSHIFT_BUILD_NAMESPACE="default" OUTPUT_DIR="dist/app_angular_demo"
USER root
COPY upload/src /tmp/src
RUN chown -R 1001:0 /tmp/src
USER 1001
RUN /usr/libexec/s2i/assemble
CMD /usr/libexec/s2i/run
COMMIT temp.builder.openshift.io/default/listas-s2i-22:503140a4
