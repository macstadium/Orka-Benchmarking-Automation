FILE=/Users/danielpierre-louis/Documents/Orka_Ansible/OrkaBenchmarking/Results/Data_Collection/results_sv2_6c_wo522.csv
if [ ! -f "$FILE" ]; then
    mv results_sv2_6c_wo522.csv "$FILE"
else 
    number=0
    outputfile="$FILE-$number"
    while [ -e "$outputfile" ]; do
        number=$(( numnber++ ))
        outputfile="$FILE-$number"
    done
        mv SalesV2_Results/results_sv2_6c_wo522.csv "$outputfile"
fi
