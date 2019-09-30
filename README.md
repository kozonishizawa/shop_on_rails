# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
2.6.3

* 環境構築
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails db:seed

* 初期管理者ID
name: "admin"
email: "1@gmail.com"
password: "111111"

* sidekiq
** 非同期処理 起動
$ bundle exec sidekiq -C config/sidekiq.yml
** 非同期処理 デーモン起動:
$ bundle exec sidekiq -C config/sidekiq.yml -d
** sidekiq停止
$ bundle exec sidekiqctl stop ./tmp/pids/sidekiq.pid

* 秘匿情報の追加/更新
$ EDITOR=vi rails credentials:edit

* デプロイ
$ bundle exec cap production deploy
