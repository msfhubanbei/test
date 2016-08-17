#/usr/bin/bash
array=(http://www.baidu.com
http://www.sina.com)

echo ${array[@]}
for data  in ${array[@]}
do
echo ${data}
http=`curl -I -m 10 -o /dev/null -s  -w %{http_code} ${data}`
sleep 5
if [ "$http" == "200" ]
then
echo "${data}  error"
fi
done
