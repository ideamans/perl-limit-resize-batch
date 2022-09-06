# 画像ファイルの解像度を一定以内に保つバッチ処理サンプル

指定したディレクトリ配下の画像を検索し、画像ファイルの解像度が一定より大きい場合、指定した縦横ピクセル数以内にリサイズして上書き保存するバッチ処理のサンプルです。

エンドユーザーがアップロードした解像度の高い画像のファイルサイズを抑える用途に利用できます。

## 要件

- Perl
- ImageMagick

## 使い方

perl limit-resize.pl <対象ディレクトリ>

## ファイル

- `limit-resize.pl` 指定ディレクトリ配下の画像をリサイズするPerlスクリプト
- `test.sh` 簡易テストシェルスクリプト
- `test/original` テスト用素材ファイル群
- `test/expected.txt` テストで期待する結果

## Thanks

Photo by <a href="https://unsplash.com/@samsungmemory?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Samsung Memory</a> on <a href="https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
  
Photo by <a href="https://unsplash.com/@skyleraugustanderson?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Skyler Anderson</a> on <a href="https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>

Photo by <a href="https://unsplash.com/@wasacrispbread?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Wasa Crispbread</a> on <a href="https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
