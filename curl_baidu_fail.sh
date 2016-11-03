#/usr/bin/bash
url="https://baidu.com.io"
count=0
curl $url >result.sh
while ([ $? -ne 0 ]&&[ $count -lt 5 ] );do
((count++))
echo "again",$count
sleep 2
curl $url >result.sh
done
sed 's/go test -v/go test/g' result.sh


