pipeline {
    agent {label 'slave'}
    stages {
        stage('Stage 1 - Create text files') {
            steps {
                sh "pwd"
                sh "mkdir -p /home/ec2-user/stage1/"
                sh "cd /home/ec2-user/stage1/ && touch test_file{01..010}.txt"
                sh '''
                    sudo echo "this is a test file" | tee test_file{01..010}.txt
                '''
            }
        }
        stage('Stage 2 - Copy and insert date to files') {
            steps {
                sh "mkdir -p /home/ec2-user/stage1/stage2/"
                sh  "cd /home/ec2-user/stage1/stage2/"
                sh "cp /home/ec2-user/stage1/*.txt /home/ec2-user/stage1/stage2/."
                sh ''' echo "$(date +"%FT%T")" |tee test_file{01..010}.txt '''
            }
        }
        stage('Stage 3 - Change permissions to ro') {
            steps {
                sh "mkdir -p /home/ec2-user/stage1/stage2/stage3/ && cd /home/ec2-user/stage1/stage2/stage3/"
                sh "cp /home/ec2-user/stage1/stage2/*.txt /home/ec2-user/stage1/stage2/stage3/."
                sh "chmod 0444 *.txt"
           }
        }
        stage('Stage 4 - Build nginx docker image') {
            steps {
                sh "cd /home/ec2-user/"
                sh "docker build -t my-web-app ."
                sh "docker run -d -p 80:80 -v /home/ec2-user/stage1/stage2/stage3:/usr/share/nginx/html --hostname my-web-app nginx"
            }
        }
    }
}


