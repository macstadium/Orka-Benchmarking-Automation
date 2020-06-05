# ./scripts/run_automatedbench.sh bench AutomatedBenchSetup.img 6 6 1 0
./scripts/run_automatedbench.sh bench AutomatedBenchSetup.img 6 6 5 0
# ./scripts/run_automatedbench.sh bench AutomatedBenchSetup.img 6 6 3 0

# ./scripts/run_automatedbench.sh bench AutomatedBenchSetup.img 6 6 1 1
# ./scripts/run_automatedbench.sh bench AutomatedBenchSetup.img 6 6 2 1
# ./scripts/run_automatedbench.sh bench AutomatedBenchSetup.img 6 6 3 1

# ./scripts/run_automatedbench.sh bench AutomatedBenchSetup.img 6 6 1 2
# ./scripts/run_automatedbench.sh bench AutomatedBenchSetup.img 6 6 2 2
# ./scripts/run_automatedbench.sh bench AutomatedBenchSetup.img 6 6 3 2

# ./scripts/run_automatedbench.sh bench AutomatedBenchSetup.img 6 6 1 3
# ./scripts/run_automatedbench.sh bench AutomatedBenchSetup.img 6 6 2 3
# ./scripts/run_automatedbench.sh bench AutomatedBenchSetup.img 6 6 3 3

cd Results
./reformat_directions
./SalesV2_Results/add_to_data_collection.sh