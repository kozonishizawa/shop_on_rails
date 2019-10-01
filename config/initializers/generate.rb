Rails.application.config.generators do |g|
  g.helper false  # helperクラスを生成しない
  g.assets false  # CSSとJSを生成しない
  g.skip_routes true   # ルーティングを変更しない
  g.test_framework false  # テストスクリプトを生成しない
end
