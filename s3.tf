resource "aws_s3_bucket" "cloud" {
  bucket = "sucessbucket"

  tags = {
    Name        = "sucesssbucket"
  }
}
resource "aws_s3_bucket" "rugged_buckets" {
  count         = length(var.s3_bucket_names) //count will be 3
  bucket        = var.s3_bucket_names[count.index]
  acl           = "private"
  region        = "us-east-1"
  force_destroy = true
}