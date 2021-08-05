pipeline
{
agent any
environment
  {
    PATH='/sbin:/bin:/usr/sbin:/usr/bin:~/.local/bin/'
  }
  stages
  {
    stage('SSH into Pcluster')
    {
      steps
      {
        script
        {
          sh 'ls -al'
          sh 'sudo sh pclustermanage.sh'
        }
      }
    } 
 stage('Save Build Log') 
    {
      steps 
      {
        script 
        {
          sh "curl ${BUILD_URL}consoleText --output ${BUILD_NUMBER}.log"
        }
      }
    }
  stage('Upload File to S3') 
    {
      steps 
      {
        script 
        {
          sh "aws s3 cp ${BUILD_NUMBER}.log s3://jenkinslogsdivino/${JOB_NAME}/${BUILD_NUMBER}.log"
        }
      }
    }
//     stage('Send SNS Notification') 
//     {
//       steps 
//       {
//         script 
//         {
//           sh "aws sns publish \
//               --topic-arn \"arn:aws:sqs:us-east-1:876279908261:sns-jenkins-build-notifier.fifo\" \
//               --message file://message.txt"
//         }
//       }
//     }
  }
  
   post { 
        always { 
            script 
              {
                sh "aws sns --region us-east-1 publish \
                    --subject \"Jenkins ${JOB_NAME} build status\" \
                    --topic-arn \"arn:aws:sns:us-east-1:876279908261:jenkins-notifier\" \
                    --message \"Job : ${JOB_NAME} :- Job Number # ${BUILD_NUMBER} - has completed. Visit s3://jenkinslogsdivino/${JOB_NAME}/${BUILD_NUMBER}.log for more details.\""
              }
        }
    }
}
