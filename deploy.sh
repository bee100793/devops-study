
  
  
 #!/bin/bash
 
  #1. 기존 컨테이너등 지우기 
   echo "==기존 컨테이너를 지웁니다 ===" 

   docker rm -f my_web
 

  #2. 깃허브에서 새로운 재료 가져오기  

  # echo " 새로운 코드등을 가져옵니다"

  # git pull origin main 

  
  #3. 새로 가져온 재료를 비날에 포장합니다 
   echo "새로운 코드등을 도커이미지로 빌드 합니다 "
 
   docker build -t my-web-image .

  #4. 새 컨테이너를 실행합니다 

    echo " 새로운 도커컨테이너를 실행합니다"
    docker run -d -p 8080:80 --name my_web my-web-image 

    echo "모든 배포과정이 끝났습니다"
     docker ps 
