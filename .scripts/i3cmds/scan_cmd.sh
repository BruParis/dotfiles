#!/bin/bash

scanimage --progress --mode Color --resolution 300 --device 'hpaio:/net/envy_5000_series?ip=192.168.1.10&queue=false' --format=png > file.png
