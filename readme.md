# README

## Problem

If you are using `colab-ssh` to connect to `colab` machine with GPU enabled, you probably have found that the `nvidia-smi` command outputs are incorrect: the `NVIDIA-SMI` and `Driver` versions are mismatched.

## Solution

The reason is that the `PATH` variable in the notebook environment differ from the ssh login environment. Some background scripts probably modified it before create an IPython kernel based notebook.

The following try to fix the problem mentioned above. It save the `$PATH` to a local disk, then load it in the `~/.bashrc` startup file.

```bash
# add this to the last cell in your colab notebook
! echo "$PATH" >/.COLABPATH
! curl -sL https://raw.githubusercontent.com/taicaile/colab-helper/master/colab.sh | sudo bash
```
