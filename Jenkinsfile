pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('docker-hub')
	}

	stages {
	    
	    stage('gitclone') {

			steps {
				git 'https://github.com/nbduong01/jenkins-101.git/'
			}
		}

		stage('Build') {

			steps {
				dir('/var/lib/jenkins/workspace/Python-pipline/s05/python-simple-app')
				sh 'docker build -t pythonspapp:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker tag pythonspapp:latest nbduong/pythonspapp:latest'
				sh 'docker push nbduong/pythonspapp:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}

/*pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                dir("${env.WORKSPACE}/s05/python-simple-app")
                sh "pwd"
                sh 'docker build -t apppysimple .'
            }
        }
    /*  stage('run') {
            steps {
                sh 'python3 s05/python-simple-app/app.py &'
            }
        }

       stage('') {
            steps {
                sh 'sleep 60 && curl -s localhost:8000'
            }
        }

        stage('cleanup') {
            steps {
                sh 'fuser -k 8000/tcp'
            }
*/