FROM node:12.11.0

RUN apt-get update && \
    apt-get install -y \
        git \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common

RUN npm install -g hapify-cli

RUN mkdir /app
RUN cd /app && git clone https://github.com/Tractr/boilerplate-hapijs.git
RUN cd /app && git clone https://github.com/Tractr/boilerplate-ngx-components.git
RUN cd /app && git clone https://github.com/Tractr/boilerplate-ngx-dashboard.git

COPY entrypoint.sh /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
