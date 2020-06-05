sed s/BUILDPLACEHOLDER/$1/ group_vars/automatebenchmark_template.yaml > automatebenchmark.tmp
sed s/NODEPLACEHOLDER/macpro-$2/ automatebenchmark.tmp > automatebenchmark.yaml
rm automatebenchmark.tmp
#orka vm create-config -v $1 -b $2 -c 
# ansible-playbook -i hosts-full -vvv automatebenchmark.yaml