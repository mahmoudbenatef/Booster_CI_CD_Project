pipeline {
    agent any

    stages {
        stage('preparation') {
            steps {
                git 'https://github.com/mahmoudbenatef/Booster_CI_CD_Project.git'
            }
        }
        stage('CI') {
            steps {
                sh 'docker build . -t atef/django_cicd:1.0'
            }
        }
        stage('CD') {
            steps {
                sh 'docker run -d -p 8000:8000 atef/django_cicd:1.0'
            }
            
            post{
            	success{
            		slackSend (color:"#09c", message: "Done")
            	}
            }
        }
        
    }
}

