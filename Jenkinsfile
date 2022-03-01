pipeline {
    agent { label 'docker' }
    parameters {
        string(name: "version", description: "Version of Ubuntu", defaultValue: "21.04")
    }

    stages {
        stage('Build Ubuntu LTS') {
            parallel{
                stage('Build Ubuntu LTS / AMD64') {
                    agent { label 'linux && amd64 && docker' }
                    steps {
                        git branch: 'master',
                            credentialsId: 'github-sobitada',
                            url: 'git@github.com:blockblu-io/cardano-base-container.git'
                        script {
                            docker.withRegistry('', 'dockerhub-blockblu') {
                                docker.build("blockblu/ubuntu:${version}_amd64", "--build-arg C_UBUNTU_IMG=${version} --no-cache --pull --platform linux/amd64 .").push()
                            }
                        }
                    }
                }
                stage('Build Ubuntu LTS / ARM64') {
                    agent { label 'linux && arm64 && docker' }
                    steps {
                        git branch: 'master',
                            credentialsId: 'github-sobitada',
                            url: 'git@github.com:blockblu-io/cardano-base-container.git'
                        script {
                            docker.withRegistry('', 'dockerhub-blockblu') {
                                docker.build("blockblu/ubuntu:${version}_arm64", "--build-arg C_UBUNTU_IMG=${version} --no-cache --pull --platform linux/arm64 .").push()
                            }
                        }
                    }
                }
            }
        }
        stage('Create and Push Manifest') {
            agent { label 'linux && docker' }  
            steps {
                script {
                    docker.withRegistry('', 'dockerhub-blockblu') {
                        sh "docker manifest create 'blockblu/ubuntu${version}' 'blockblu/ubuntu:${version}_amd64' 'blockblu/ubuntu:${version}_arm64'"
                        sh "docker push --purge 'blockblu/ubuntu${version}'"
                    }
                }
            }
        }
    }
}