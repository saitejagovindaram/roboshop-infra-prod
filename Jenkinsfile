pipeline{
    agent {
        node {
            label 'agent-1'
        }
    }
    options {
        timeout(time: 1, unit: 'HOURS')
        disableConcurrentBuilds()
        ansiColor('xterm')
    }
    parameters{
        booleanParam(name: 'destroy', defaultValue: false, description: 'Want to destroy?')
        booleanParam(name: 'apply', defaultValue: false, description: 'Want to Apply?')
    }
    stages{
        stage('VPC apply'){
            when {
                expression { params.apply == true }
            }
            steps{
                sh """
                    cd 01-vpc/
                    terraform init
                    terraform apply -auto-approve
                """
            }
        }
        stage('SG apply'){
            when {
                expression { params.apply == true }
            }
            steps{
                sh """
                    cd 02-sg/
                    terraform init
                    terraform apply -auto-approve
                """
            }
        }
        stage('VPN apply'){
            when {
                expression { params.apply == true }
            }
            steps{
                sh """
                    cd 03-vpn/
                    terraform init
                    terraform apply -auto-approve
                """
            }
        }
        stage('DB and ALB apply') {
            parallel {
                stage('Databases'){
                     when {
                        expression { params.apply == true }
                    }
                    steps{
                        sh '''
                            cd 04-databases
                            terraform init
                            terraform apply -auto-approve
                        ''' 
                    } 
                }
                  stage('App ALB'){
                     when {
                        expression { params.apply == true }
                    }
                    steps{
                        sh '''
                            cd 05-app-alb
                            terraform init
                            terraform apply -auto-approve
                        ''' 
                    }
                }
            }
        }


        stage('DB and ALB destroy') {
            parallel {
                stage('Databases'){
                    when {
                        expression { params.destroy == true }
                    }
                    steps{
                        sh '''
                            cd 04-databases
                            terraform init
                            terraform destroy -auto-approve
                        ''' 
                    } 
                }
                  stage('App ALB'){
                    when {
                        expression { params.destroy == true }
                    }
                    steps{
                        sh '''
                            cd 05-app-alb
                            terraform init
                            terraform destroy -auto-approve
                        ''' 
                    }
                }
            }
        }

       
        stage('VPN destroy'){
            when {
                expression { params.destroy == true }
            }
            steps{
                sh """
                    cd 03-vpn/
                    terraform init
                    terraform destroy -auto-approve
                """
            }
        }
        
        stage('SG destroy'){
            when {
                expression { params.destroy == true }
            }
            steps{
                sh """
                    cd 02-sg/
                    terraform init
                    terraform destroy -auto-approve
                """
            }
        }
         stage('VPC destroy'){
            when {
                expression { params.destroy == true }
            }
            steps{
                sh """
                    cd 01-vpc/
                    terraform init
                    terraform destroy -auto-approve
                """
            }
        }
        
    }

    post {
        always{
            echo 'I will run always'
            deleteDir()
        }
    }


}