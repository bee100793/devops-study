#!/bin/bash

 #1. my_web 이라는 이름의 컨테이너가 실행중인지 확인 
 
  echo "===my_web 컨테이너 상태 점검을 시작합니다==="
   
    #2. 현재돌아가는 도커리스트중  my_web이라는 것 갯수세서 0개면 지금 안돌아가는거고 0이 아니면 지금 돌아가는 중잉다
  if [ $(docker ps -f name=my_web | grep -c my_web) -eq 0 ]; then
	  echo "경고 :my _web 컨테이너가 중지되었습니다 재부팅을 하겠습니다"
     docker start my_web
else 
	 echo " 정상 : my_web컨테이너가 정상작동 중입니다."
  fi

   echo "===정검완료=="
