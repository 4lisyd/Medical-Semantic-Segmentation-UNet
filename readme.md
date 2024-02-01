# U-Net: Semantic segmentation with PyTorch

<a href="https://pytorch.org/"><img src="https://img.shields.io/badge/PyTorch-v1.13+-red.svg?logo=PyTorch&style=for-the-badge" /></a>
<a href="#"><img src="https://img.shields.io/badge/python-v3.6+-blue.svg?logo=python&style=for-the-badge" /></a>

![input and output for a random image in the test dataset](https://i.imgur.com/GD8FcB7.png)

## Quick start

### Without Docker

1. [Install CUDA](https://developer.nvidia.com/cuda-downloads)

2. [Install PyTorch 1.13 or later](https://pytorch.org/get-started/locally/)

3. Install dependencies

```bash
pip install -r requirements.txt
```

4. Download the data and run training:

```bash
bash scripts/download_data.sh
python train.py --amp
```

## Description

This model was trained from scratch with 267 images of lungs (radiology) and there respective masks in bi-colored color channel. Managed to score a [Dice coefficient](https://en.wikipedia.org/wiki/S%C3%B8rensen%E2%80%93Dice_coefficient) of score:**0.96035277** on over 5 epochs and 37 iterations.

## Usage

**Note : Use Python 3.6 or newer**

### Training

```console
> python train.py -h
usage: train.py [-h] [--epochs E] [--batch-size B] [--learning-rate LR]
                [--load LOAD] [--scale SCALE] [--validation VAL] [--amp]

Train the UNet on images and target masks

optional arguments:
  -h, --help            show this help message and exit
  --epochs E, -e E      Number of epochs
  --batch-size B, -b B  Batch size
  --learning-rate LR, -l LR
                        Learning rate
  --load LOAD, -f LOAD  Load model from a .pth file
  --scale SCALE, -s SCALE
                        Downscaling factor of the images
  --validation VAL, -v VAL
                        Percent of the data that is used as validation (0-100)
  --amp                 Use mixed precision
```

By default, the `scale` is 0.5, so if you wish to obtain better results (but use more memory), set it to 1.

### Prediction

After training your model and saving it to `MODEL.pth`, you can easily test the output masks on your images via the CLI.

To predict a single image and save it:

`python predict.py -i image.jpg -o output.jpg`

## Data

You can also download it using the helper script:

```
bash scripts/download_data.sh
```

&

```
bash scripts/img_channel_to_1.sh
```

To convert the images from 1 channel to 3. This would make the unnecessary need to change the UNet architecture,time is of the essence rn ;)

The input images and target masks should be in the `data/imgs` and `data/masks` folders respectively (note that the `imgs` and `masks` folder should not contain any sub-folder or any other files, due to the greedy data-loader).

[images](https://drive.google.com/file/d/1l86uyjZfNGwJnNwrIgN2CIoynjxtXLQc/view?usp=drive_link)
[masks](https://drive.google.com/file/d/1qDP0Z4aHq4Ki0-V6pcCBKneQOv5D56kD/view?usp=drive_link)

---

Original paper by Olaf Ronneberger, Philipp Fischer, Thomas Brox:

[U-Net: Convolutional Networks for Biomedical Image Segmentation](https://arxiv.org/abs/1505.04597)

![network architecture](https://i.imgur.com/jeDVpqF.png)
