pipeline {
  agent any
  stages {
      stage('Startup')
        steps {
              echo 'Building is started'
              }
          }
       stage('Pre-building')
        steps{
          echo 'Building the project..'
          sh 'cmake...'
          sh 'make'
             }
        stage('Test')
          steps{
            echo 'Testing the project..'
            
          }
       }
    }
        
          
      
