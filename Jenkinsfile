pipeline {
    agent {
        docker {
            image 'python:3.11'
        }
    }

    environment {
        VENV_DIR = 'venv'
    }

    stages {
        stage('Docker Agent Check') {
            steps {
                sh 'echo "Python version:" && python --version'
            }
        }

        stage('Clone GitHub Repo') {
            steps {
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

        stage('Set Up Venv and Install Deps') {
            steps {
                sh """
                set -e  # Exit on error for better debugging
                echo "Creating venv..."
                python -m venv ${VENV_DIR}
                echo "Activating venv..."
                . ${VENV_DIR}/bin/activate
                echo "Upgrading pip..."
                pip install --upgrade pip
                echo "Installing local package..."
                pip install -e .
                echo "Done installing dependencies."
                """
            }
        }
    }

    post {
        failure {
            echo '❌ Build failed! Check above for error details.'
        }
        always {
            echo '🧹 Cleaning up workspace (if needed)...'
        }
    }
}
