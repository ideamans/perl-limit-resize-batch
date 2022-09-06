#!/bin/bash

set -e
cd $(dirname $0)

ORIGINAL_DIR="./test/original"
SANDBOX_DIR="./test/sandbox"
EXPECTED_FILE="./test/expected.txt"
ACTUAL_FILE="./test/sandbox/actual.txt"

# 作業用ディレクトリの削除と作成
rm -rf  "$SANDBOX_DIR"
cp -a "$ORIGINAL_DIR" "$SANDBOX_DIR"

# 作業用ディレクトリに対しバッチ処理を実行
perl ./limit-resize.pl "$SANDBOX_DIR"

# ファイルと解像度を取得
echo "Actual:"

find "$SANDBOX_DIR" -type f -not -name '*not-image*' -exec identify -format "%t %wx%h\n" "{}" \; > "$ACTUAL_FILE"

# 期待する結果
echo
echo "Expected:"
cat "$EXPECTED_FILE"

# 実際の結果と期待する結果を比較
echo
echo "Diff:"
diff "$EXPECTED_FILE" "$ACTUAL_FILE"