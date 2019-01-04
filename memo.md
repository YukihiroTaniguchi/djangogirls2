

docker image をビルド
```shell
docker build -t django_girls:1.0 /Users/yukihiro/Documents/practice/djangogirls
```
docker container を実行
```shell
sudo docker run -it -p 8000:8000 \
                    -v /Users/yukihiro/Documents/practice/djangogirls/webapp:/root/mysite \
                    --name django_girls \
                    django_girls:1.0 \
                    /bin/bash
```

コンテナにログイン
```shell
docker exec -it django_girls /bin/bash
```

コンテナ内でrequirements.txtからdjangoをインストール
```shell
pip3 install -r requirements.txt
```

django ローカルサーバー起動
```shell
python3 manage.py runserver 0.0.0.0:8000
```

ローカルからポートフォーワードへのアクセス  
```
http://127.0.0.1:8000/
```
django管理サイト
```
http://127.0.0.1:8000/admin/login/
```

新しいアプリケーションの作成
```shell
python3 manage.py startapp blog
```

データベースにモデルのためのテーブルを作成する  
1. djangoに変更を認識させ,migrateファイルを作成
```shell
python3 manage.py makemigrations blog
```
2. migrateファイルをデータベースに反映
```shell
python3 manage.py migrate blog
```

##### heroku デプロイ
コンテナをイメージにする
```shell
docker commit コンテナ名 イメージ名(ここで作成する)
```
デプロイ用のDockerfileを作成する  
...  

ログイン
```shell
heroku login
```
container ログイン
```shell
heroku container:login
```
herokuのアプリ作成(ドメイン名になる)
```shell
heroku create django01
```
herokuにpush(Dcokerfileをもとにされる)
```shell
heroku container:push web --app django01
```
herokuにrelease
```shell
heroku container:release web --app django01
```
