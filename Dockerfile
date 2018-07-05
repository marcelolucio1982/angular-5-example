FROM 172.30.1.1:5000/ci/scripts-openshift

## copy over the artifacts in dist folder to default nginx public folder
COPY dist/ /usr/share/nginx/html