# Define the AWS provider
provider "aws" {
  region = "us-west-2"
}

# Define the event themes and your initials
variable "event_themes" {
  default = ["adventuretech", "natureescape", "datasummit"]
}

variable "initials" {
  default = "js"
}

# Create S3 buckets for each event theme
resource "aws_s3_bucket" "event_buckets" {
  count = length(var.event_themes)
  bucket = "${var.event_themes[count.index]}-${var.initials}-bucket"
  
}

# Output the names of the created buckets
output "bucket_names" {
  value = aws_s3_bucket.event_buckets[*].bucket
}
