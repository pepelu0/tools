#!/usr/bin/env bash
basepath=$(cd `dirname $0`; pwd)
POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -u|--username)
    USERNAME="$2"
    shift # past argument
    shift # past value
    ;;
    -h|--host)
    HOST="$2"
    shift # past argument
    shift # past value
    ;;
    -p|--password)
    PASSWORD="$2"
    shift # past argument
    shift # past value
    ;;
    -r|--remark)
    REMARK="$2"
    shift
    shift
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

if [[ -z "$USERNAME" ]];then
    echo "USERNAME required, please use -u or --username to specify USERNAME"
    exit -1
fi

if [[ -z "$HOST" ]];then
    echo "HOST required, please use -h or --host to specify HOST"
    exit -1
fi

if [[ -z "$PASSWORD" ]];then
    echo "PASSWORD required, please use -p or --password to specify PASSWORD"
    exit -1
fi

if [[ -z "$REMARK" ]];then
    echo "REMARK required, please use -r or --remark to specify REMARK"
    exit -1
fi

printf "$HOST $USERNAME $PASSWORD $REMARK\n" >> $basepath"/servers.conf"
