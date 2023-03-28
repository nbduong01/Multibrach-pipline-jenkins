#!/bin/bash
export AWS_ACCESS_KEY_ID 		= ${AWS_ACCESS_KEY_ID}
export AWS_SECRET_ACCESS_KEY 	= ${AWS_SECRET_ACCESS_KEY}
export AWS_DEFAULT_REGION 		= ${AWS_DEFAULT_REGION}
export AWS_DEFAULT_OUTPUT 		= ${AWS_DEFAULT_OUTPUT}

sudo aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | sudo docker login --username AWS --password-stdin 356705062463.dkr.ecr.us-east-1.amazonaws.com

sudo docker push ${ECR_REPO}:${BUILD_ID}
