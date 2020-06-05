FILE=/Users/danielpierre-louis/Documents/Orka_Ansible/OrkaBenchmarking/Results/Data_Collection/results_sv2_6c_wo522.csv
if [ ! -f "$FILE" ]; then
    mv results_sv2_6c_wo522.csv "$FILE"
else 
    number=0
    outputfile="$FILE-$number"
    while [ -e "$outputfile" ]; do
        number=$(( numnber++ ))
        outputfile="$FILE-$number"
        # echo "one pass"
        # echo "Adding output to $outputfile"
        # ls ../Data_Collection/$outputfile
    done
        mv SalesV2_Results/results_sv2_6c_wo522.csv "$outputfile"
fi


# mv results_sv2_6c_wo522.csv /Users/danielpierre-louis/Documents/Orka_Ansible/OrkaBenchmarking/Results/Data_Collection/results_sv2_6c_wo522.csv


# number=0

# fname="$results_sv2_6c_wo522.csv"
# printf "$fname"
# while [ -e "Data_Collection/$fname" ]; do
#     cp fname "Data_Collection/$fname" "$(( ++number ))"
# done

# FILE=/Users/danielpierre-louis/Documents/Orka_Ansible/OrkaBenchmarking/Results/results_sv2_6c_wo522.csv
# if test -f "$FILE"; then
#     mv "$FILE" "$FILE"+1 ;

# fi


# #!/bin/sh

# num=1
# outfile="results_sv2_6c_wo522.csv"

# while [ -e "$outfile" ]; do
#     num=$(( num + 1 ))
#     outfile="results_sv2_6c_wo522$num.csv"
# done

# cd ../ ./reformat_directions

# name=results_sv2_6c_wo522
# if [[ -e $name.csv || -L $name.csv ]] ; then
#     i=0
#     while [[ -e $name-$i.csv || -L $name-$i.csv ]] ; do
#         let i++
#     done
#     name=$name-$i
# fi
# # touch -- "$name".csv
# mv -n results_sv2_6c_wo522.csv ../Data_Collection
