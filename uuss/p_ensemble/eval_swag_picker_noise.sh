#!/bin/bash

# python -u swag_modified/uncertainty/uncertainty.py --file="tuning/128_0.05_3e-4_0.01/swag-20.pt" \
#         --data_path="./data" --train_dataset="uuss_train.h5" --validation_dataset="uuss_test_fewerhist.h5" \
#         --n_duplicates_train=3 --batch_size=128 --method=SWAG --cov_mat --scale=0.5 \
#         --save_path="tuning/128_0.05_3e-4_0.01/swag_test_uncertainty"

# 128_0.0005_5e-3_0.0002_84_24_20

batch_size=128
sgd_lr=0.0005
weight_decay=5e-3
swa_lr=0.0002
epochs=75
swa_start=25
K=20

seeds=(1 2 3)
#models=(60)
epoch=60
splits=("YSnoiseZ")
for seed in ${seeds[@]}; do
        dir="./seed${seed}_${batch_size}_${sgd_lr}_${weight_decay}_${swa_lr}_${epochs}_${swa_start}_${K}"
        #dir="./seed${seed}_${batch_size}_${sgd_lr}_${weight_decay}_${swa_lr}"
        echo $dir
	#for epoch in {60..75};do
	#for epoch in ${models[@]};do
	for split in ${splits[@]};do
        python -u ../../swag_modified/uncertainty/uncertainty.py --file="${dir}/swag-${epoch}.pt"\
                --data_path="../uuss_data/p_resampled" --train_dataset="uuss_train_4s_1dup.h5" \
		--validation_dataset="${split}_4s.h5" \
                --batch_size=${batch_size} --method="SWAG" --cov_mat --scale=0.5 --seed=${seed} \
                --save_path="${dir}/eval_40_noise/swag_${split}_uncertainty_${epoch}" --max_num_models=$K --N=40 &
        wait -n 
        wait
	done
done
