#!/bin/bash
echo "This is a idle script (infinite loop) to keep container running."
echo "Please replace this script."
set -x

#trap cleanup SIGINT SIGTERM

sub2(){
    
    echo "sub2:",$PPID,$$,$UID,$!
    sleep 20
    ps -o pid,ppid,state,tty,command
    #exit 0
}
sub(){
    sub2 &
    echo "sub:",$PPID,$$,$UID,$!
    ps -o pid,ppid,state,tty,command
    pstree -p $PPID
    pstree -p $UID
    pstree -p $$
    pstree -p $!
    while ((1));do
        echo "sub2-while:",$PPID,$$,$UID,$!
        sleep 100
        
    done
}
sub &
