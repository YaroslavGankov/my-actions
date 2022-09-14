#!/bin/bash
sudo apt -y update
sudo apt install -y vsftpd
#активируем включение при загрузке
sudo systemctl enable vsftpd
#делаем бэкап настроек ftp-сервера на всякий случай
path_to_conf=/etc/vsftpd.conf
sudo cp $path_to_conf $path_to_conf.original
#корректируем настройки для норм работы сервера
sudo sed -i 's/listen=NO/listen=YES/' $path_to_conf
sudo sed -i 's/listen_ipv6=YES/listen_ipv6=NO/' $path_to_conf
sudo sed -i 's/listen_ipv6=YES/listen_ipv6=NO/' $path_to_conf
sudo sed -i 's/#write_enable=NO/write_enable=YES/' $path_to_conf
sudo sed -i 's/#write_enable=YES/write_enable=YES/' $path_to_conf
sudo sed -i 's/local_enable=NO/local_enable=YES/' $path_to_conf
echo "userlist_enable=YES" >> $path_to_conf
echo "userlist_file=/etc/vsftpd.userlist" >> $path_to_conf
echo "userlist_deny=NO" >> $path_to_conf

#создаём пользователей
sudo useradd user1
sudo useradd user2-fuck-fuck-user-ftp43

#добавляем пользователей в список
echo "user1" | sudo tee -a /etc/vsftpd.userlist
sudo mkdir /home/user1
sudo chown user1:user1 /home/user1
sudo mkdir /home/user2-fuck-fuck-user-ftp43
sudo chown user2-fuck-fuck-user-ftp43:user2-fuck-fuck-user-ftp43 /home/user2-fuck-fuck-user-ftp43

echo "user2-fuck-fuck-user-ftp43" >> /etc/vsftpd.userlist

sudo systemctl restart vsftpd
sudo systemctl stop vsftpd

sudo apt install -y samba

