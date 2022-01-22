#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=us1.ethermine.org:4444
WALLET=0x1bF76A1E42F4d8ef0493c10142E84E215Ca18eDD.lolMinerWorker

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

./lolMiner --algo ETHASH --pool $POOL --user $WALLET $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./lolMiner --algo ETHASH --pool $POOL --user $WALLET $@
done
