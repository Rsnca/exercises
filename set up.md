## コンテナー作成
- docker imageを取ってくる
[dockerhub](https://hub.docker.com/_/mysql)
```
$ docker pull mysql --platform linux/x86_64
$ docker run --name mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql
```
## MySQLサーバー接続
- VScodeのコンテナーから作成したコンテナーを開く
- 拡張機能のMySQLを開く
- +ボタンからconnect to serverを開き、SQLサーバーに接続する。