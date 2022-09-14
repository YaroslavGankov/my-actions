#!/bin/bash
sudo apt -y update
sudo apt install -y nginx
#активируем включение nginx при загрузке
sudo service nginx enable