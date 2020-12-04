#
# Configure the state locking mechanism
#
#
# Create the bucket, set encryption and versioning
#
resource "aws_s3_bucket" "terraform_state" {
  bucket = join("",var.cohort_id,"psa-cohort-state-files")
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
#
# Create the Dynamodb table for locking
#
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "PSA_State_Locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
