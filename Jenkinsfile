def environmentFromBranch(branch) {
  if (branch == 'master') {
    return 'production'
  } else if (branch == 'staging') {
    return 'staging'
  } else {
   return ''
  }
}

pipeline {
  agent any

  parameters {
    string(name: 'hugo_version', defaultValue: '0.55.5', description: 'The Hugo version that will be used to build the website. Must match versions speficied on https://github.com/gohugoio/hugo/releases.')
    string(name: 'node_version', defaultValue: '10.15.3', description: 'The Node.js version that will be used to build the website. Must match versions specified on https://nodejs.org/en/download/releases/. It is adivsed to stick to LTS versions.')
  }

  environment {
    APP_NAME = 'openadx.eclipse.org'
    NAMESPACE = 'foundation-internal-webdev-apps'
    IMAGE_NAME = 'eclipsefdn/openadx.eclipse.org'
    ENVIRONMENT = environmentFromBranch(env.BRANCH_NAME)
    GIT_COMMIT_SHORT = sh(
      script: "printf \$(git rev-parse --short ${GIT_COMMIT})",
      returnStdout: true
    )
  }

  options {
    buildDiscarder(logRotator(numToKeepStr: '10'))
  }

  tools {
    oc 'oc-3.9' 
  }

  stages {
    stage('Build and push image') {
      agent {
        label 'docker-build'
      }
      steps {
        sh '''
          docker build --no-cache --pull --build-arg HUGO_VERSION=${hugo_version} --build-arg NODE_VERSION=${node_version} -t ${IMAGE_NAME}:${GIT_COMMIT_SHORT}-${BUILD_NUMBER} -t ${IMAGE_NAME}:latest .
        '''
        withDockerRegistry([credentialsId: '04264967-fea0-40c2-bf60-09af5aeba60f', url: 'https://index.docker.io/v1/']) {
          sh '''
            docker push ${IMAGE_NAME}:${GIT_COMMIT_SHORT}-${BUILD_NUMBER}
            docker push ${IMAGE_NAME}:latest
          '''
        }
      }
    }

    stage('Deploy to cluster') {
      when {
        anyOf {
          environment name: 'ENVIRONMENT', value: 'production'
          environment name: 'ENVIRONMENT', value: 'staging'
        }
        expression {
          openshift.withCluster('c1-ci.eclipse.org') {
            openshift.withProject("${NAMESPACE}") {
              return openshift.selector('deployments', [app: "${APP_NAME}", environment: "${ENVIRONMENT}"]).exists();
            }
          }
        }
      }
      steps {
        script {
          openshift.withCluster('c1-ci.eclipse.org') {
            openshift.withProject("${NAMESPACE}") {
              def appSelector = openshift.selector('deployments', [app: "${APP_NAME}", environment: "${ENVIRONMENT}"])
              appSelector.describe()
              def app = appSelector.object()
              app.spec.template.spec.containers[0].image = "${IMAGE_NAME}"+':'+"${GIT_COMMIT_SHORT}-${BUILD_NUMBER}"
              openshift.apply(app)
              timeout(5) {
                appSelector.rollout().status()
              }
            }
          }
        }
      }
    }
  }

  post {
    always {
      deleteDir() /* clean up workspace */
    }
  }
}
