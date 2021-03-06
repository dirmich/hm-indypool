FROM bcgovimages/von-image:node-1.12-3
# FROM bcgovimages/von-image:py36-1.16-1

ENV LOG_LEVEL ${LOG_LEVEL:-info}
ENV RUST_LOG ${RUST_LOG:-warning}

ADD config ./config
ADD server/requirements.txt server/
#RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r server/requirements.txt

ADD --chown=indy:indy indy_config.py /etc/indy/
ADD --chown=indy:indy ./bin $HOME/bin
ADD --chown=indy:indy ./cli-scripts $HOME/cli-scripts
ADD --chown=indy:indy ./scripts $HOME/scripts
ADD --chown=indy:indy ./config $HOME/config

RUN mkdir -p \
    $HOME/cli-scripts \
    && chmod -R ug+rw $HOME/cli-scripts

VOLUME ["/home/indy/ledger"]
# FROM node:12.18-alpine
# ENV NODE_ENV=production
# WORKDIR /usr/src/app
# COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
# RUN npm install --production --silent && mv node_modules ../
# COPY . .
# EXPOSE 3000
# CMD ["node", "index.js"]
