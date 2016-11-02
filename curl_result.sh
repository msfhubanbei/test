#/usr/bin/bash
url="https://aone.qiniu.io/api/coverage/collect"
echo "++++++++",$result
result=$(curl $url)
while [ $? -ne 0 ];do
echo "again"
sleep 2
result=$(curl $url)
done

echo $result|sed 's/go test -v/go test/g' 

