# zaif 用のコマンドラインツール

# 必要環境
## env
- Python3.6+
- jq

## 動作確認環境
- Mac OS X Sierra (10.12.6)


## 準備
- ZaifからAPIキー、シークレットを取得し、環境変数ZAIF_API_KEY, ZAIF_API_SECRET に保存してください。
- setup.sh を実行してください。

# コマンドリスト
## zaif-trade-log
zaif の取引履歴をすべて取得し、jsonまたはCSVで出力します。
引数なしで実行した場合JSONとして出力、--csvを渡した場合CSVとして出力します。
(要APIKEY,SECRET)

## zaif-log-parser
`zaif-trade-log` の出力JSONをパースして、現時点の課税対象利益を出します。
現在のところ、円との取引のみ対応しており、ビットコインと(jpyを除く)他の通貨間の取引(mona_btcなど)には対応していません。


## zaif-status
現在の保有通貨を出力します。
(要APIKEY,SECRET)

## zaif-status-watch
現在の保有通貨を定期的(1時間ごと)に出力します。
(要APIKEY,SECRET)

## zaif_inc.sh
include ライブラリ
(要APIKEY,SECRET)

