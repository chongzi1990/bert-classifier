#!/usr/bin/env bash
export BERT_BASE_DIR=./chinese_L-12_H-768_A-12 #全局变量 下载的预训练bert地址
export MY_DATASET=./data/ #全局变量 数据集所在地址

python3 run_classifier.py \
  --task_name=classifier  \
  --do_train=true \
  --do_eval=true \
  --do_predict=true \
  --data_dir=$MY_DATASET \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --max_seq_length=128  \
  --train_batch_size=64 \
  --learning_rate=5e-5 \
  --num_train_epochs=5.0 \
  --output_dir=./fine_tuning_out/text_classifier_64_epoch10_5e5