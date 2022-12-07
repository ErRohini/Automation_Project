name="Rohini"
s3_bucket="upgrad-rohini"
timestamp=$(date '+%d%m%Y-%H%M%S')
sudo apt update -y
sudo apt install apache2
sudo ufw app list
sudo ufw allow 'Apache'
cp -r /var/log/apache2/ /tmp/${name}-httpd-logs-${timestamp}.tar
sudo apt update
sudo apt install awscli
aws configure
aws s3 cp --recursive /tmp/${name}-httpd-logs-${timestamp}.tar s3://${s3_bucket}/${name}-httpd-logs-${timestamp}.tar
