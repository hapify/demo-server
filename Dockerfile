FROM node:12.11.0

RUN apt-get update && \
    apt-get install -y \
        git \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common

RUN npm install -g @hapify/cli@0.7.9

RUN mkdir /app
RUN hpf -d /app new \
     --boilerplate-url https://github.com/Tractr/boilerplate-hapijs.git \
     --boilerplate-url https://github.com/Tractr/boilerplate-ngx-components.git \
     --boilerplate-url https://github.com/Tractr/boilerplate-ngx-dashboard.git \
     --preset 5c8607a696d1ff00107de412 \
     --preset 5c869a8996d1ff00107de42b \
     --preset 5c86966796d1ff00107de41c \
     --project-name "Demo project" \
     --project-desc "Sample project for Hapify"

VOLUME /app

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
