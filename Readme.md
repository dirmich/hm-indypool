sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose


IP=3.36.94.8 GENESIS_URL=https://margin.ga/genesis docker-compose up -d

[amazon linux에서 publicIP 찾기]
curl http://checkip.amazonaws.com