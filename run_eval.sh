module swap python3/3.10.12
export PATH=$PATH:~/.local/bin
export ENV_BLACKHOLE=/dtu/blackhole/02/202562
export WORKON_HOME=$ENV_BLACKHOLE/adlcv_env

source virtualenvwrapper.sh
workon adlcv
export HF_HOME=$WORKON_HOME/adlcv
module swap gcc/9.5.0-binutils-2.38
module swap cuda/11.3

python -m evaluation.pipeline --base_path ./data/k360_30-10_scG_pd10_pc4_spY_all/ \
    --use_features "class"  "color"  "position"  "num" \
    --no_pc_augment \
    --no_pc_augment_fine \
    --hungging_model t5-large \
    --fixed_embedding \
    --path_coarse ./checkpoints/coarse.pth \
    --path_fine ./checkpoints/fine.pth
