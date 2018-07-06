FROM 172.30.1.1:5000/ci/scripts-openshift

## copy over the artifacts in dist folder to default nginx public folder
COPY dist/ /usr/share/nginx/html

RUN chmod -R u+x ${APP_ROOT}/bin && \
    chgrp -R 0 ${APP_ROOT} && \
    chmod -R g=u ${APP_ROOT} /etc/passwd && \
    chgrp -R 0 /etc/nginx/ && \
    chmod -R g=u /etc/nginx/ && \
    chgrp -R 0 /usr/share/nginx/ && \
    chmod -R g=u /usr/share/nginx/ && \
    chgrp -R 0 /var/log/nginx/ && \
    chmod -R g=u /var/log/nginx/ && \
    chgrp -R 0 /var/cache/nginx/ && \
    chmod -R g=u /var/cache/nginx/ && \
    chgrp -R 0 /var/run/ && \
    chmod -R g=u /var/run/

### Containers should NOT run as root as a good practice
USER 10001
WORKDIR ${APP_ROOT}

### user name recognition at runtime w/ an arbitrary uid - for OpenShift deployments
ENTRYPOINT [ "uid_entrypoint" ]

CMD ["nginx", "-g", "daemon off;"]