clear
rm -rf apps

echo Downloading...

#git clone https://github.com/Leafboi111/LeafOS
git clone --quiet https://github.com/Leafboi111/LeafOS_LTS > /dev/null

echo Installing...
sleep 0.1

rm -rf apps

cp -r LeafOS_LTS/apps apps

rm -rf LeafOS_LTS

chmod 777 apps/*
chmod 777 os/*

echo Done!
sleep 0.1