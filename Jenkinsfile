pipeline {
    agent slave
    stages {
        stage('Stage 1 - Create text files') {
            steps {
                sh "pwd"
                sh "mkdir -p /home/ec2-user/stage1/"
                sh "cd /home/ec2-user/stage1/ && touch test_file{01..010}.txt"
                sh '''
                    echo "this is a test file" | tee test_file{01..010}.txt
                '''
            }
        }
        stage('Copy and insert date to files') {
            steps {
                sh "mkdir -p /home/ec2-user/stage1/stage2/ && cd /home/ec2-user/stage1/stage2/"
                sh "cp /home/ec2-user/stage1/*.*.txt ."
                sh '''
                    echo $(date +"%FT%T")" | tee test_file{01..010}.txt
                '''

            }
        }
        stage('Change permissions to ro') {
            steps {
                sh "mkdir -p /home/ec2-user/stage1/stage2/stage3/ && cd /home/ec2-user/stage1/stage2/stage3/"
                sh "chmod 0444 *.txt"
            }
        }
    }
}