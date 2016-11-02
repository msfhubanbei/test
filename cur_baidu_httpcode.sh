#/usr/bin/bash
array=(http://www.baidu.com
http://www.sina.com
https://aone.qiniu.io/api/coverage/collect?token=A59B8029-E9A1-4FF3-B72B-3657CEAC64D4)

echo ${array[@]}
for data  in ${array[@]}
do
echo ${data}
http=`curl -I -m 10 -o /dev/null -s  -w %{http_code} ${data}`
echo "http",$http,"http_code",${http_code}
sleep 5
if [ "$http" == "200" ]
then
echo "${data}  error"
fi
done
