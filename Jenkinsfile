pipeline{
	agent{
		label any
	}
	environment {
		DOCKER_IMAGE = 'python/app'

		ECR_REPO 	= '356705062463.dkr.ecr.us-east-1.amazonaws.com/pythonwebapp'
		APP_VERSION = "${BUILD_ID}"
		APP_ENV 	= "${BRANCH_NAME}"

		AWS_ACCESS_KEY_ID 		= credentials('AWS_ACCESS_KEY_ID')
		AWS_SECRET_ACCESS_KEY 	= credentials('AWS_SECRET_ACCESS_KEY')
		AWS_DEFAULT_REGION 		= 'us-east-1'
		AWS_DEFAULT_OUTPUT 		= 'json'

		STAGING_TASK 	= 'python_staging_task'
		STAGING_CLUSTER = 'python_staging_cluster'
		STAGING_SERVICE = 'Python_staging_srv'

		RELEASE_TASK 	= 'python_release_task'
		RELEASE_CLUSTER = 'python_release_cluster'
		RELEASE_SERVICE = 'Python_release_srv'
	}
	stages{
		stage('[PYTHON] Build'){
			steps{
				echo "========BUILD App========"
				sh 'sudo docker build -t ${DOCKER_IMAGE}:${BUILD_ID} .'
				sh 'sudo docker tag ${DOCKER_IMAGE}:${BUILD_ID} ${ECR_REPO}:${BUILD_ID}'
			}
		}
		stage('[PYTHON] Push to ECR'){
			steps{
				echo "========PUSH to ECR========"
				sh '''
				export AWS_ACCESS_KEY_ID 		= ${AWS_ACCESS_KEY_ID}
				export AWS_SECRET_ACCESS_KEY 	= ${AWS_SECRET_ACCESS_KEY}
				export AWS_DEFAULT_REGION 		= ${AWS_DEFAULT_REGION}
				export AWS_DEFAULT_OUTPUT 		= ${AWS_DEFAULT_OUTPUT}

				sudo aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | sudo docker login --username AWS --password-stdin 356705062463.dkr.ecr.us-east-1.amazonaws.com

				sudo docker push ${ECR_REPO}:${BUILD_ID}
				'''
			}
		}
		stage('[PYTHON] Deploy to staging') {
			when{
				branch 'staging'
			}
			steps{
				echo "========DEPLOY TO STAGING========"

			}
		}
	}
}