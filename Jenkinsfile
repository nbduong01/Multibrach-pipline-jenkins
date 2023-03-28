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
				echo "========Build App========"
				sh '.push.sh'
			}
		}
	}
}