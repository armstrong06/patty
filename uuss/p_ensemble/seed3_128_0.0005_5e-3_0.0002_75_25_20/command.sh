../../swag_modified/train/run_swag.py --data_path=../uuss_data/p_resampled --train_dataset=uuss_train_4s_1dup.h5 --validation_dataset=uuss_validation_4s_1dup.h5 --load_model=../../pretrained_models/scsn_seed2412047_model003.pt --eval_freq=1 --max_num_models=20 --seed=3 --batch_size=128 --epochs=75 --model=PPicker --save_freq=1 --lr_init=0.0005 --wd=5e-3 --swa --swa_start=25 --swa_lr=0.0002 --cov_mat --dir=./seed3_128_0.0005_5e-3_0.0002_75_25_20 --no_schedule
