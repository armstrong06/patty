../../swag_modified/train/run_swag.py --data_path=../uuss_data/p_resampled --train_dataset=uuss_train_4s_1dup.h5 --validation_dataset=uuss_validation_4s_1dup.h5 --load_model=../../pretrained_models/scsn_seed2412045_model003.pt --eval_freq=1 --batch_size=128 --epochs=10 --model=PPicker --save_freq=1 --lr_init=0.005 --wd=1e-3 --dir=./SGD_tuning/128_0.005_1e-3_10 --no_schedule
