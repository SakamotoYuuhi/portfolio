# Docker コンテナ起動を行う. 
docker-compose up -d --build

# 次の jwilder/dockerize でタイムアウトになった場合にセットアップスクリプトを停止させるようにする.
set -e

# 0.5秒周期で Django と MySQL コンテナから応答があるまで待機する. (上限 1分間)
# docker-compose run --rm dockerize sh -c 'dockerize -wait http://django:8001 -wait tcp://db:3307 -timeout 1m -wait-retry-interval 0.5s'

# jwilder/dockerize の処理が済んだので、set -e を無効にする.
set +e