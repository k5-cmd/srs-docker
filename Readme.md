# srs-docker

[SRS](https://github.com/ossrs/srs)の環境を docker で建てられるようにしました。  
SRS のバージョンは master に合わせて 4.0release を用いています。  
各種 conf の調整などは[SRS のドキュメント](https://ossrs.io/lts/en-us/docs/v4/doc/getting-started)を参考にしてください。

# 使い方

## 初回起動

configureとmakeで必要ファイルを作成する必要があります。  
docker-compose.yamlのcommandで実行する内容をsleepにしたうえで起動し、execでコンテナ内に入って各種コマンドを実行してください。

```
docker-compose up -d
docker-compose exec -it srs bash
(ここからコンテナ内で行うコマンド)
configure
make
```
コンテナ内でmakeが完了し、`./srs/trunk/objs/srs`のファイルが生成されれば初回起動で行う作業は完了です。  
docker-compose.yamlのcommand部分を修正し下記を参考にsrsを起動してください。  

## srs 起動

初回起動時の設定以降、コンテナを建てるだけで srs が起動します。（初回起動時にsleepで起動するようにしている場合は戻し忘れにご注意ください）  
必要に応じてdocker-compose.yaml の command 部分（`./objs/srs -c conf/docker.conf`）にて使いたい conf を選択、細かい設定が必要な場合は適宜修正してください。  

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
