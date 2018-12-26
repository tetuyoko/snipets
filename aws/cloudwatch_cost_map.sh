#!/bin/bash

DAYSAGO=30

if [ "$(uname)" == 'Darwin' ]; then
  OS='Mac'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  OS='Linux'
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi

### LogGroupの一覧を取得
LOG_GROUPS=$(aws cloudwatch list-metrics \
  --namespace "AWS/Logs" \
  --metric-name "IncomingLogEvents" \
  --query "Metrics[].Dimensions[?Name==\`LogGroupName\`].Value" \
  --output text)

### LogGroup単位で前日分からDAYSAGOに指定した日数だけ処理する
for LOG_GROUP in ${LOG_GROUPS}
do
  ENDDAY=0
  STARTDAY=$((ENDDAY+${DAYSAGO}))

  ### MacとLinuxでdateコマンドのオプションを指定
  if [ "${OS}" == "Mac" ]; then
    STARTTIME="$(date -u -v-${STARTDAY}d +%Y-%m-%dT00:00:00Z)"
    ENDTIME="$(date -u -v-${ENDDAY}d +%Y-%m-%dT00:00:00Z)"
  else
    STARTTIME="$(date -u --date "${STARTDAY} days ago" +%Y-%m-%dT00:00:00Z)"
    ENDTIME="$(date -u --date "${ENDDAY} days ago" +%Y-%m-%dT00:00:00Z)"
  fi

  ### LogGroupごとに1日分のIncomingBytesの合計を出力
  echo "### LogGroup: ${LOG_GROUP} ###"
  aws cloudwatch get-metric-statistics \
    --namespace "AWS/Logs" \
    --dimensions Name=LogGroupName,Value="${LOG_GROUP}" \
    --metric-name "IncomingBytes" \
    --statistics "Sum" \
    --start-time "${STARTTIME}" \
    --end-time "${ENDTIME}" \
    --period 86400 \
    --query "reverse(sort_by(Datapoints,&Timestamp)[?Sum>\`0\`].{Sum:Sum,Timestamp:Timestamp})" \
    --output text
done
