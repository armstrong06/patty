#!/bin/bash

#["BatchSize", "SGD_lr", "WD", "Mom" "SWA_lr", "K"]
BS=128
SGD_LR=0.003
#SWA_LR=(0.0001 0.0002)
swa_learning_rates=(0.001)
WD=5e-3
EPOCHS=85
SWA_START=25

#max_num_models=(20)
K=20
models=(56)
#for K in ${max_num_models[@]}; do
for SWA_LR in ${swa_learning_rates[@]}; do
    for model_num in ${models[@]}; do # {11..60}
    #for model_num in {26..85}; do
        dir="./SWAG_tune_lr/${BS}_${SGD_LR}_${WD}_${SWA_LR}_${EPOCHS}_${SWA_START}_${K}"
        in_file="${dir}/swag-${model_num}.pt"
        out_file="${dir}/val_results_100/val_eval_swag-${model_num}"
        python -u ../../swag_modified/uncertainty/uncertainty.py --file=$in_file \
                --data_path="../uuss_data/s_resampled/" --train_dataset="uuss_train_6s_1dup.h5" \
                --validation_dataset="uuss_validation_6s_1dup.h5" --model="SPicker" \
                --batch_size=${BS} --method=SWAG --cov_mat --scale=0.5 \
                --save_path=$out_file --max_num_models=$K --N=100 &
        wait -n
        wait
    done
done
