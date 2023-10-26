#!/usr/bin/env groovy

library identifier: 'jenkins-shared-library@main', retriever: modernSCM(
                   [$class: 'GitSCMSource',
                    remote: 'https://github.com/JavaNoobPig/jenkins-shared-library.git',
                    credentialsId: 'GitRepoCredentials'
                    ]
)
pipeline {
  agent any
  tools {
    maven 'maven-3.8.4'
  }
  environment {
    IMAGE_NAME = 'javapig/demo-app:ec2-test'
  }
  stages {
    stage('build Jar') {
      steps {
        script {
          echo 'building Jar...'
          buildJar()
        }
      }
    }
    stage('build Image') {
      steps {
        script {
          echo 'building docker image...'
          buildImage(env.IMAGE_NAME)
          dockerLogin()
          dockerPush(env.IMAGE_NAME)
        }
      }
    }
    stage('provision server') {
      environment {
        AWS_ACCESS_KEY_ID = credentials('jenkins_aws_access_key_id')
        AWS_SECRET_ACCESS_KEY = credentials('jenkins_aws_secret_access_key')
        TF_VAR_env_prefix = 'test'
      }
      steps{
        script{
          dir('terraform'){
              sh "terraform init"
              sh "terraform apply --auto-approve"
              EC2_PUBLIC_IP = sh(
                script: "terraform output ec2_public_ip"
                returnStdout: true
              ).trim()
          }
        }
      }
    }    
    stage('deploy') {
      steps {
        script {
          echo 'EC2 Server have already done docker login, so do not need to login again!'

          def shellCmd = "bash ./server-cmds.sh ${IMAGE_NAME}"
          def ec2Instance = "ec2-user@${EC2_PUBLIC_IP}"
          sshagent(['ec2-server-key']) {
               sh "scp server-cmds.sh ${ec2Instance}:/home/ec2-user"
               sh "scp docker-compose.yaml ${ec2Instance}:/home/ec2-user"
               sh "ssh -o StrictHostKeyChecking=no ${ec2Instance} ${shellCmd}"
          }
          echo 'deploying application...'
        }
      }
    }
  }
}
