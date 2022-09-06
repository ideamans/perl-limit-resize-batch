#!/usr/bin/perl

use strict;
use File::Basename;

# 最大の幅と高さ
my $max_width = 1024;
my $max_height = 1024;

# 一時ディレクトリ
my $tmp_dir = '/tmp';

# JPEGの場合の品質
my $jpeg_quality = 85;

sub usage_and_exit {
  my ( $code ) = @_;
  print "Usage: $0 <dir>\n";
  exit $code;
}

my $dir = $ARGV[0];
usage_and_exit 1 if !$dir;

my @paths = split /\n\r?/, `find $dir -type f`;
for my $path ( @paths) {
  # 拡張子の確認
  my ( $format ) = $path =~ /\.(jpe?g|png)$/i;
  next if !$format;

  # identifyコマンドで画像情報を取得
  my $identify = `identify $path 2>/dev/null`;
  next if $? != 0;

  # 画像の幅と高さ (最大の幅と高さ以内の場合は何もしない)
  my ( $width, $height ) = $identify =~ /(\d+)x(\d+)/;
  next if $width <= $max_width && $height <= $max_height;

  # アスペクト比を保ち幅と高さが最大に収まるように計算
  my ( $new_width, $new_height ) = ( $width, $height );
  if ( $new_height > $max_height ) {
    $new_width = int( $new_width * $max_height / $new_height );
    $new_height = $max_height;
  }
  if ( $new_width > $max_width ) {
    $new_height = int( $new_height * $max_width / $new_width );
    $new_width = $max_width;
  }

  # 一時ファイルを経由してリサイズ
  my $basename = basename $path;
  if ( $format eq 'jpg') {
    `convert "$path" -resize ${new_width}x${new_height} -quality $jpeg_quality "$tmp_dir/$basename"`;
  } elsif ( $format eq 'png' ) {
    `convert "$path" -resize ${new_width}x${new_height} "$tmp_dir/$basename"`;
  }
  `mv "$tmp_dir/$basename" "$path"`;
}
