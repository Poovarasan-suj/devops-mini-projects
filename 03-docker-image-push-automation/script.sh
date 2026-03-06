####Push Image to Docker HUB

####Build the image using docker file
#!/bin/bash

if [ -f Dockerfile ] ; then
             docker build -t mywebapp:v1 /home/sujith/my-mini-project/ && docker tag mywebapp:v1 poovarasane/mywebapp:v1
             if [ $? -eq 0 ] ; then
                  docker push poovarasane/mywebapp:v1
                  echo "Image pushed Docker Hub successfully"
             else
                     exit 1
             fi
else
        echo "Failed to build the image"
fi