export INSTANCE_DIR="../1_imgs_in/taza1"
export MODEL_NAME="CompVis/stable-diffusion-v1-1"
export OUTPUT_DIR="../3_generated_models/taza1-SD1"

lora_pti \
  --pretrained_model_name_or_path=$MODEL_NAME  \
  --instance_data_dir=$INSTANCE_DIR \
  --output_dir=$OUTPUT_DIR \
  --train_text_encoder \
  --resolution=512 \
  --train_batch_size=1 \
  --gradient_accumulation_steps=4 \
  --scale_lr \
  --learning_rate_unet=1e-5 \
  --learning_rate_text=1e-5 \
  --learning_rate_ti=5e-4 \
  --color_jitter \
  --lr_scheduler="linear" \
  --lr_warmup_steps=0 \
  --placeholder_tokens="<taza1>" \
  --initializer_tokens="mug" \
  --use_template="style"\
  --save_steps=500 \
  --max_train_steps_ti=500 \
  --max_train_steps_tuning=1200 \
  --perform_inversion=True \
  --clip_ti_decay \
  --weight_decay_ti=0.000 \
  --weight_decay_lora=0.001\
  --continue_inversion \
  --continue_inversion_lr=1e-4 \
  --device="cuda:0" \
  --lora_rank=1