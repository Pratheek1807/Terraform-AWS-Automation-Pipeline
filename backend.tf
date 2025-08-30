terraform {
  backend "s3" {
    bucket = "backend_state"
    key    = "state"
    region = "us-east-1"
    dynamodb_table = "dyno"
  }
}
