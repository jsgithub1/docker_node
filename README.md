# AWS Docker + Node Sample

This is a sample project created using the Node.js project template from JetBrains/RubyMine.  I created it as part of
an investigation into AWS support for Docker.  Below are the steps I used to successfully build/run/test a Docker image
on my local machine and then deploy to AWS ElasticBeanstalk.

*Note:* These instructions assume you have already gone through the process of installing and configuring the [Docker Toolbox](https://www.docker.com/docker-toolbox) on
your system.
  
*Step 1:*  Clone and or download the docker_node project from GitHub.

## Building and Running Locally

1.  Build the Docker image (from the docker_node project root directory).  
    > docker build -t &lt;your organization or account&gt;/docker_node .
   
2.  Start a Docker container from your new image.  You can modify the arguments to the -p option to control the port the application uses on your Docker host.  This command uses the application default port of 3000.
    > docker run -p 3000:3000 -d &lt;your organization or account&gt;/docker_node
    
3.  Verify that your container is running using `> docker ps` or the Kitematic docker GUI

4.  Test using the Kitematic GUI or open a browser to http://&lt;docker host&gt;:3000

***Note:*** If you are running Docker using docker-machine on a system other than Linux.  For example, I used OSX.  You can obtain the IP address of the Docker host vm using `> docker-machine ls`

## Deploying to ElasticBeanstalk

1.  Create an archive of the docker_node project suitable for uploading to AWS ElasticBeanstalk using git
    > git archive --format=zip HEAD > docker_node.zip
     
2.  Log in to your AWS account and create a new ElasticBeanstalk application.  
    * Give it whatever name you like
    * For environment, choose 'Create web server' environment
       * For predefined configuration, select 'Generic->Docker'
       * For environment type, choose 'Single instance'
    * On the application version page, select 'Upload your own' and choose the zip you created in step #1
    * Choose whatever you like for environment name and URL (note this URL is the public one you'll use to see your sample app up and running so you may want to make a note of it now)
    * No additional resources
    * Leave the defaults for Configuration Details (should be a t1.micro instance)
    * No additional environment tags
    * Allow AWS to create a suitable instance profile and service role if needed
    * Launch!
    
3.  AWS will build and launch the EC2 instance from the description in the Dockerfile.  Once it is up and running you should be able to see the sample app by navigating to the URL you selected for your new environment (note that you should not include the port 3000 in this URL as
AWS will map port 80 on the EC2 instance to the exposed port 3000 in your Docker container.
    
    
    
    
