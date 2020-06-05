#!/bin/bash

array=( 
    # 2048 
    # audiokit_ios
    # audiokit_macos
    # brave_ios
    # duck_duck_go
    edhita
    # irccloud_ios
    # nextcloud_ios
    # react_native
    # simplenote-ios
    # talk_ios
    # wikipedia
    # wire_ios
    # wordpress
    # wwdc
    )
# echo Commencing Benchmark Test...
# # Ask the user for VM name
# echo Enter name of VM
# read varvmname # $varvmname

# echo Enter name of Image
# read varimagename # $varimagename

# echo Enter VM Cpu
# read varvmcpu # $varvmcpu

# echo Enter VM VCpu
# read varvmvcpu # $varvmvcpu

# echo Enter Node
# read varnode # $varnode

for TEST in "${array[@]}"
do
    orka vm create-config -v $1 -b $2 -c $3 -C $4 -y

    if [ "$6" = 0 ]
        then
            orka vm deploy -v $1 -n macpro-$5 -y
    fi     

    if [ "$6" = 1 ]; then
        orka vm deploy -v $1 -n macpro-$5 -y
        orka vm deploy -v $1 -n macpro-$5 -y
    fi

    if [ "$6" = 2 ]; then
        orka vm deploy -v $1 -n macpro-$5 -y
        orka vm deploy -v $1 -n macpro-$5 -y
        orka vm deploy -v $1 -n macpro-$5 -y
    fi

    if [ "$6" = 3 ]; then
        orka vm deploy -v $1 -n macpro-$5 -y
        orka vm deploy -v $1 -n macpro-$5 -y
        orka vm deploy -v $1 -n macpro-$5 -y
        orka vm deploy -v $1 -n macpro-$5 -y
    fi

sleep 50s

    scripts/sub_bench_automation.sh $TEST $5
    ansible-playbook -i salesv2-hosts-full -vvv automatebenchmark.yaml
    cd Results
    if [ "$6" = 0 ]; then
        for f in ex_$TEST*.txt; do mv "$f" "con00/CAT_OST_Pure-$3c$4C_${f%.txt}_con$6.txt"; done
    cd ../
    fi

    if [ "$6" = 1 ]; then
        for f in ex_$TEST*.txt; do mv "$f" "con001/CAT_OST_Pure-$3c$4C_${f%.txt}_con$6.txt"; done
    cd ../
    fi

    if [ "$6" = 2 ]; then
        for f in ex_$TEST*.txt; do mv "$f" "con002/CAT_OST_Pure-$3c$4C_${f%.txt}_con$6.txt"; done
    cd ../
    fi

    if [ "$6" = 3 ]; then
        for f in ex_$TEST*.txt; do mv "$f" "con003/CAT_OST_Pure-$3c$4C_${f%.txt}_con$6.txt"; done
    cd ../
    fi

    orka vm purge -v $1 -y
sleep 10s
done
echo "THIS IS A CHECK"
pwd



