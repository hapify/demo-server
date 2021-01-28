FROM node:12.11.0

RUN apt-get update && \
    apt-get install -y \
        git \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common

RUN npm install -g @hapify/cli@0.8.1

RUN mkdir /app
RUN hpf -d /app new \
     --boilerplate-url https://github.com/Tractr/boilerplate-hapijs.git \
     --boilerplate-url https://github.com/Tractr/boilerplate-ngx-components.git \
     --boilerplate-url https://github.com/Tractr/boilerplate-ngx-dashboard.git \
     --preset 60104aabe0fe50001033f10e \
     --preset 60104aabe0fe50001033f110 \
     --preset 60104aabe0fe50001033f10f \
     --project-name "Demo project" \
     --project-desc "Sample project for Hapify"

VOLUME /app

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
