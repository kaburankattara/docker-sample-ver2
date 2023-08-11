# 使い方
## 1.コンテナを起動する
### コンテナ起動プログラムを選択
OSに合わせてコンテナ起動プログラムを選択します。<br/>
windows:docker-up.ps1<br/>
MAC:docker-up.sh

### プロジェクト名を指定
コンテナ起動プログラム内にコンテナを起動するdocker-composeコマンドがあります。<br/>
「-p」オプションの後を任意に修正し、プロジェクト名を変更します。

### コンテナを起動
コンテナ起動プログラムを実行し、コンテナを起動します。

## 2.redmineへのアクセス
### ログイン
[http://localhost:8080/](http://localhost:8080/)にアクセスします。<br/>
ユーザー名/パスワードを求められるのでadmin/adminでログインします。

### adminユーザーのパスワードを変更
ログイン認証に成功するとパスワード変更画面に遷移します。<br/>
adminユーザーのパスワードを変更します。


# 参考文献
## dockerhub redmine
https://hub.docker.com/_/redmine

https://changami.com/2017/02/redmine-on-docker-internal-error-with-japanese/
