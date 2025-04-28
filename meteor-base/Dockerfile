ARG NODE_VERSION
ARG METEOR_VERSION

FROM node:${NODE_VERSION} 
ARG METEOR_VERSION
ENV METEOR_VERSION=${METEOR_VERSION}
WORKDIR /meteor/app

RUN curl https://install.meteor.com/?release=${METEOR_VERSION} | sh

COPY start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT [ "/start.sh" ]

EXPOSE 3000