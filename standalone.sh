docker ps -aq | xargs docker stop 
docker ps -aq | xargs docker rm
docker run --name zlog -it zlog-test /bin/bash
