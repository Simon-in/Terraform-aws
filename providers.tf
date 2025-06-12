terraform {
  required_providers {
    aws = {
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

  # 认证方式（按优先级选择一种）：
  # 1. 静态凭证（不推荐直接写在代码中）
  # access_key = "AKIAUMYCIVFFO3EUMEXH"
  # secret_key = "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"

  # 2. 环境变量
  # 提前设置：
  # export AWS_ACCESS_KEY_ID="xxx" 
  # export AWS_SECRET_ACCESS_KEY="xxx"

  # 3. AWS CLI 共享凭证文件（默认路径 ~/.aws/credentials）
  # shared_credentials_files = ["~/.aws/credentials"]
  # profile = "default"  # 指定配置文件名