# CONCURRENCY 0 BENCHMARKING
./scripts/run_automatedbench.sh bench AutomatedBenchSetup.img 6 6 1 0
# ./scripts/run_automatedbench.sh bench AutomatedBenchSetup.img 6 6 2 0
# ./scripts/run_automatedbench.sh bench AutomatedBenchSetup.img 6 6 3 0

# CONCURRENCY 1 BENCHMARKING 
# ./scripts/run_automatedbench.sh bench AutomatedBenchSetup.img 6 6 1 1
# ./scripts/run_automatedbench.sh bench AutomatedBenchSetup.img 6 6 2 1
# ./scripts/run_automatedbench.sh bench AutomatedBenchSetup.img 6 6 3 1

# CONCURRENCY 2 BENCHMARKING (12C MACPRO'S ONLY)
# ./scripts/run_automatedbench.sh bench AutomatedBenchSetup.img 6 6 1 2
# ./scripts/run_automatedbench.sh bench AutomatedBenchSetup.img 6 6 2 2
# ./scripts/run_automatedbench.sh bench AutomatedBenchSetup.img 6 6 3 2

# CONCURRENCY 3 BENCHMARKING (12C MACPRO'S ONLY)
# ./scripts/run_automatedbench.sh bench AutomatedBenchSetup.img 6 6 1 3
# ./scripts/run_automatedbench.sh bench AutomatedBenchSetup.img 6 6 2 3
# ./scripts/run_automatedbench.sh bench AutomatedBenchSetup.img 6 6 3 3
pwd
cd Results
# REFORMAT DATA
./reformat_directions.sh
# ADD DATA TO COLLECTION DIRECTORY
./SalesV2_Results/add_to_data_collection.sh
date | awk '{tmp=$0; gsub(/ /,"",tmp); gsub(/:/,"",tmp); print tmp}' > date.file
for file in `cat date.file`;do mkdir -p $file; mv con*/* $file/. ; mkdir -p SalesV2_Results/$file; mv SalesV2_Results/con*/* SalesV2_Results/$file/. ;done