pipeline {
    agent any

    environment {
        VENV_DIR = 'venv'
    }

    stages {
        stage('Cloning Github repo to Jenkins') {
            steps {
                script {
                    echo 'Cloning Github repo to Jenkins ........'
                    checkout scmGit(
                        branches: [[name: '*/main']],
                        extensions: [],
                        userRemoteConfigs: [[
                            credentialsId: 'github-token',
                            url: 'https://github.com/kkbgit/MLOPS-COURSE-PROJ1.git'
                        ]]
                    )
                }
            }
        }

        stage('Setting up our Virtual Environment and Installing dependencies') {
            steps {
                script {
                    echo 'Setting up Virtual Environment and Installing dependencies ........'
                    sh '''
                    # Ensure venv package is available
                    #apt-get update
                    jenkins ALL = NOPASSWD: ALL
                    apt-get install -y python3-venv python3-pip

                    # Create virtual environment
                    python3 -m venv ${VENV_DIR}
                    . ${VENV_DIR}/bin/activate

                    # Upgrade pip and install dependencies
                    pip install --upgrade pip
                    pip install -e .
                    '''
                }
            }
        }
    }
}