../../swag_modified/train/run_swag.py --data_path=../uuss_data/s_resampled --train_dataset=uuss_train_6s_1dup.h5 --validation_dataset=uuss_validation_6s_1dup.h5 --load_model=../../pretrained_models/stead_seed2412045_model_004.pt --eval_freq=1 --batch_size=128 --epochs=30 --model=SPicker --save_freq=1 --lr_init=0.01 --wd=1e-2 --dir=./SGD_tuning/128_0.01_1e-2_30 --no_schedule
