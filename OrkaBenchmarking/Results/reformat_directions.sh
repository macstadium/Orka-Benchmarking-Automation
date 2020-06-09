echo "Pipeline,Hardware,Build,Platform,OS,buildinfo.project,buildinfo.type,concurrency,buildinfo.time,Ignore?,Machine,datetime,buildinfo.command.0,buildinfo.command.1,VM type,storage,environment.release,environment.initial_cpu.physical_cores,environment.initial_cpu.total_cores,environment.initial_cpu.frequency,environment.initial_memory.total" > SalesV2_Results/results_sv2_6c_wo522.csv
echo "con00" > folder.txt
echo "con001" >> folder.txt
# echo "con002" >> folder.txt
# echo "con003" >> folder.txt
for folder in `cat folder.txt`;do cd $folder; echo $folder;
for file in `ls`;do awk -f ../../format-bench-v2.awk $file > ../SalesV2_Results/$folder/$file;done
pwd
cd ../SalesV2_Results/$folder
pwd
for file in `ls *.txt`; do mv $file ${file%.txt}.csv;done
for file in `ls`;do awk '{if (NR==1) { } else {print $0}}' $file >> ../results_sv2_6c_wo522.csv ;done 
cd ../../ ;done
pwd
