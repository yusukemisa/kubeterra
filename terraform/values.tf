locals {
  // localsにはモジュール内で使用できる変数を定義できるブロックのこと
  // モジュールは特定のパスに存在する定義を再利用するための仕組みで
  // このリソースはこのモジュールの値参照、と定義することができる。
  // dev,staging,prodみたいに環境ごとにディレクトリを作っておき、共通の定義はモジュール参照、
  // 環境ごとに値を定義したい箇所は個別に定義といった使い方ができる。
  project = "my-kubernetes-225704"
  region = "asia-east1"
  zone = "asia-northeast1-a"
  kubernetes = {
    name = "terraform-cluster"
  }
  network = {
    name = "terraform-network"
  }
  // file("path")はterraformのBuilt-in Functions。どんなものがあるかは以下参照
  // https://www.terraform.io/docs/configuration/interpolation.html#built-in-functions
  credentials = "${file(".terraform-service-account.json")}"
}