pipeline {
    agent any
    stages {
        stage('Stage 1 - Create text files') {
            steps {
                sh "pwd"
                sh "rm -rf stage1"
                sh "mkdir stage1"
                sh "cd stage1"
                sh "touch test_file{01..010}.txt"
                sh '''
                    echo "this is a test file" | tee test_file{01..010}.txt
                '''
            }
        }
        stage('Copy and insert date to files') {
            steps {
                sh "mkdir stage1/stage2/"
                sh "cd stage1/"
                sh "cp *.txt stage2/"
                sh '''
                    echo $(date +"%FT%T")" | tee test_file{01..010}.txt
                '''

            }
        }
        stage('Change permissions to ro') {
            steps {
                sh "mkdir stage1/stage2/stage3"
                sh "cd stage1/stage2/stage3"
                sh "chmod 0444 *.txt"
            }
        }
    }
}