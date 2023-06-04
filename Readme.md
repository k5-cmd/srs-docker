# srs-docker

[SRS](https://github.com/ossrs/srs)の環境を docker で建てられるようにしました。  
SRS のバージョンは master に合わせて 4.0release を用いています。  
各種 conf の調整などは[SRS のドキュメント](https://ossrs.io/lts/en-us/docs/v4/doc/getting-started)を参考にしてください。

# 使い方

## srs 起動

docker-compose.yaml の command 部分にて使いたい conf を指定し、コンテナを建てるだけで srs が起動します。

```
docker-compose up -d
```

例えば rtmp インジェスト ⇒HLS 出力したい場合は`conf/hls.conf`、rtmp インジェスト ⇒MPEG-DASH で出力したい場合は`conf/dash.conf`を選択します。

## 配信

エンコーダーからの配信 URL

```
rtmp://ip:1935/live/livestream
```

視聴 URL(HLS の場合)

```
http://ip:8080/live/livestream.m3u8
```

視聴 URL(MPEG-DASH の場合)

```
http://ip:8080/live/livestream.m3u8
```

## srs の停止

コンテナを落とします

```
docker-compose down
```

イメージなども含めて削除する場合は下記

```
docker-compose down --volumes --rmi all
```
