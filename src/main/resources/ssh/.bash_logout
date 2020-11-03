## ...

## docker clean

# user
rm ~/.docker/config.json
# admin
sudo rm /root/.docker/config.json

## history clean

# user
rm ~/.local/share/mc/history
rm ~/.bash_history
history -c
# admin
sudo rm /root/.local/share/mc/history
sudo rm /root/.bash_history
sudo history -c

## console clean

clear
