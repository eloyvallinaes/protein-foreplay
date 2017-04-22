#!/bin/bash
#
# gres_test.bash
# Submit as follows:
# sbatch --gres=gpu:1 -n1 -N1-1 gres_test.bash
#
srun --gres=gpu:1 -n1 --exclusive show_device.sh &
srun --gres=gpu:1 -n1 --exclusive show_device.sh &
srun --gres=gpu:1 -n1 --exclusive show_device.sh &
wait
