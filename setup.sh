#!/bin/bash

set -e

NODE_NAME=NewNode1
NODE_PORT=3001
SEED=000000000000000000000000NewNode1
DOCKER_NAME=node1

sudo rm -rf $(pwd)/ledger
mkdir -p  $(pwd)/ledger/sandbox
cp $(pwd)/ref/* $(pwd)/ledger/sandbox
sudo chown -R 1001:1001 $(pwd)/ledger

docker run --rm -v $(pwd)/ledger:/home/indy/ledger:rw dirmich/hm-did-node init_indy_keys --name $NODE_NAME --seed $SEED
docker run -e "IP=$IP" -e "NODE_NAME=$NODE_NAME" -e "NODE_PORT=$NODE_PORT" -d --name $DOCKER_NAME -p$NODE_PORT:$NODE_PORT -p$((NODE_PORT+1)):$((NODE_PORT+1)) -v $(pwd)/ledger:/home/indy/ledger:rw dirmich/hm-did-node ./scripts/start_node.sh 1

verkey=C5kGvXEZCpubAnpk7NTLXBXCUJn3HuHBtasU5vfsKNMw

PUBKEY=Agtq8PRkHS9uSzNFcjPsV4K3RbZ12WsGpkeTMwYdF9Mk
BLSKEY=3PwvnD3z3eDjYitAvcWRd2tPaQfKNrdPNeDRiEWLJbvJh3LJefwV6hj2LKrBRPNS35Jtc2zgVCX7dHJPM24P8kSP9iMCjmvn3FfCwhYDYE8T6ac2YtjEiuU3mE73ZKf7KkTopvUnsEY2i4N6Ce7E6ZDvzAG5Z1EYQt1j3jPz3AZv91D
BLSPOP=RS8iyeFQ2gBjeZ9FWSfSAG9MxAj5zR31mtDr84ZdCRcKKWTrveZDo9Ggx9xUK7zdcJNYHwbAJwmZHzXv4v6ebKGmYM5ipB78qHmMcctHSZVxiR3Tn7QAYNT94STVymH3nXwbzM2PMgXVtNQdYSTn2JUmcG5gMbn4EawvTQUhhwh8XR
echo "ledger node target=$verkey client_port=$((NODE_PORT+1)) client_ip=$IP alias=$NODE_NAME node_ip=$IP.255.255.255 node_port=$NODE_PORT services=VALIDATOR blskey=$BLSKEY blskey_pop=$BLSPOP"

PUBKEY: Public key is 
verkey: Verification key is 
BLSKEY: BLS Public key is 
BLSPOP: Proof of possession for BLS key is 

ledger node target=C5kGvXEZCpubAnpk7NTLXBXCUJn3HuHBtasU5vfsKNMw client_port=3002 client_ip=3.36.94.8 alias=NewNode1 node_ip=3.36.94.8 node_port=3001 services=VALIDATOR blskey=3PwvnD3z3eDjYitAvcWRd2tPaQfKNrdPNeDRiEWLJbvJh3LJefwV6hj2LKrBRPNS35Jtc2zgVCX7dHJPM24P8kSP9iMCjmvn3FfCwhYDYE8T6ac2YtjEiuU3mE73ZKf7KkTopvUnsEY2i4N6Ce7E6ZDvzAG5Z1EYQt1j3jPz3AZv91D blskey_pop=RS8iyeFQ2gBjeZ9FWSfSAG9MxAj5zR31mtDr84ZdCRcKKWTrveZDo9Ggx9xUK7zdcJNYHwbAJwmZHzXv4v6ebKGmYM5ipB78qHmMcctHSZVxiR3Tn7QAYNT94STVymH3nXwbzM2PMgXVtNQdYSTn2JUmcG5gMbn4EawvTQUhhwh8XR


[새로운 노드 추가]
1. pool create sandbox gen_txn_file=/home/indy/ledger/sandbox/pool_genesis_transactions
2. pool connect sandbox
3. wallet open wallet1 key
4. did new seed=000000000000000000000000Trustee1 did=V4SGRU86Z58d6TV7PBUe6f
5. did use V4SGRU86Z58d6TV7PBUe6f
6. did new seed={random seed} // did new seed=000000000000000000000000NewNode1 // MLH5EAmQUTEcvNUv3Hp75G,{verkey}
7. ledger nym did=MLH5EAmQUTEcvNUv3Hp75G verkey=~PfXwyFj4CCkPPXe2wajtUy role=STEWARD
8. ledger nym did=MLH5EAmQUTEcvNUv3Hp75G role=STEWARD
9. did use MLH5EAmQUTEcvNUv3Hp75G
9. ledger node target=C5kGvXEZCpubAnpk7NTLXBXCUJn3HuHBtasU5vfsKNMw client_port=3002 client_ip=3.36.94.8 alias=NewNode1 node_ip=3.36.94.8 node_port=3001 services=VALIDATOR blskey=3PwvnD3z3eDjYitAvcWRd2tPaQfKNrdPNeDRiEWLJbvJh3LJefwV6hj2LKrBRPNS35Jtc2zgVCX7dHJPM24P8kSP9iMCjmvn3FfCwhYDYE8T6ac2YtjEiuU3mE73ZKf7KkTopvUnsEY2i4N6Ce7E6ZDvzAG5Z1EYQt1j3jPz3AZv91D blskey_pop=RS8iyeFQ2gBjeZ9FWSfSAG9MxAj5zR31mtDr84ZdCRcKKWTrveZDo9Ggx9xUK7zdcJNYHwbAJwmZHzXv4v6ebKGmYM5ipB78qHmMcctHSZVxiR3Tn7QAYNT94STVymH3nXwbzM2PMgXVtNQdYSTn2JUmcG5gMbn4EawvTQUhhwh8XR

#  ledger nym did=MLH5EAmQUTEcvNUv3Hp75G role=STEWARD