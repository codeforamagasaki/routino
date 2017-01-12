# routino
ルーティーノを用いた経路探索

## プロジェクトについて
[CodeforAmagasaki](https://www.facebook.com/codeforamagasaki/)が取り組んでいるバリアフリーマップとその経路探索アプリです
尚、当プロジェクトは[アーバンデータチャレンジ](http://urbandata-challenge.jp/)に参加しています


**[本番環境](http://ec2-35-163-207-176.us-west-2.compute.amazonaws.com/routino/router.html)**

当プロジェクトは
　クライアントサイドに[OpenLayrs](https://openlayers.org/)
　サーバサイドに[Routino](http://www.routino.org/)
　インフラに[AWS](https://us-west-2.console.aws.amazon.com/ec2/)
を用いています

## 参加方法
* 英和翻訳が出来る方
translations/translation.ja.txt の翻訳をお願いします
タブで区切られた左側が原本で右側を日本語にして下さい
少し日本語を記入してますので、解ると思います
変換にはサーバ側でスクリプトの実行が必要なので即時反映は出来ません
時間毎にスクリプトを実行しますので、少しお待ち下さい
* HTML + CSS + JavaScript + C + Perl + Gitが解る方
バリアフリーマップの作成をお願いします
即時反映は出来ません
時間毎に反映スクリプトを実行しますので、少しお待ち下さい
Cファイルはサーバ側でmakeを実行する必要が有ります
テスト環境は用意してませんので、バグを混入した方が取り除いて下さい
* 地図が描ける方
[OSM](http://www.openstreetmap.org/)で歩道の整備をお願いします
* 現地調査が出来る方
マッピング（パーティ）しましょう
* デザインが出来る方
バリアプリーマップをオシャレにして下さい
* SNSが得意な方
拡散をお願いします
* 試験出来る方
バリアフリーマップの悪い所を洗い出して下さい

## 課題
- [ ] 日本語メニュが表示されない
- [ ] 縦（階）の経路探索が出来ない
- [ ] SSL未適用
- [ ] wheelchair=yesの歩道が少ない、繋がってない
- [ ] 日中交通量の多い道路を探索してしまう…危険
- [ ] 見た目がいまいち
- [ ] 2017/01/27(金) 作品〆

## ライセンス
2-clause BSD License
ISC Licens

