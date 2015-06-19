PERCENTAGE=`df -H -l | grep G | awk '{print $5}'`
echo $PERCENTAGE
