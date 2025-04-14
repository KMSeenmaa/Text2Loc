module swap python3/3.10.12
export PATH=$PATH:~/.local/bin
export ENV_BLACKHOLE=/dtu/blackhole/02/202562
export WORKON_HOME=$ENV_BLACKHOLE/adlcv_env

source virtualenvwrapper.sh
workon adlcv
export HF_HOME=$WORKON_HOME/adlcv
module swap gcc/9.5.0-binutils-2.38
module swap cuda/11.3

python -m datapreparation.kitti360pose.prepare \
    --path_in $BLACKHOLE/adlcv_project/data/scannet/scans \
    --path_out $BLACKHOLE/adlcv_project/data/scannet/scans \
    --scene_name scene0000_00 \
    --cell_size 5 \
    --cell_dist 1 \
    --pose_dist 1 \
    --pose_count 4 \
    --shift_poses \
    --grid_cells