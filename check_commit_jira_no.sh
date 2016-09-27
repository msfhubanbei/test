#!/bin/bash

rev=$1

if [[ "$1" != "" ]]; then
  git log --pretty=format:'%h %ae %s (%cd)' --date=iso $rev^..$rev | awk '{print $3,$2}' | grep -v Merge | sort | uniq -c
  exit 0
fi

merge="^[a-z0-9]+ Merge .*$"
validmsg="^[a-z0-9]+ QCOS-[0-9]+.*$"

git log --pretty=format:'%h %s <%an> (%cd)' --date=iso -n3 | while IFS= read -r line ; do
  if [[ "$line" =~ $merge ]]; then
    echo "skip message: $line"
  else
    if [[ ! "$line" =~ $validmsg ]]; then
      echo "not valid message: $line"
      echo "please rewrite commit message:"
      echo "  e.g. \`git commit -m \"QCOS-XXXX <your message>\" --amend; git push origin -f\`"
      exit 1
    else
      echo "valid message: $line"
    fi
  fi
done
