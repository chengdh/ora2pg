crontab -l > /tmp/mycron
# echo "*/1 * * * * cd /home/cdhdev/muyuan-dev/ora2pg && ./task.sh" >> /tmp/mycron
echo "*/20 * * * * cd /docker/muyuan-dev/ora2pg && ./task.sh" >> /tmp/mycron
#install new cron file
crontab /tmp/mycron
rm /tmp/mycron