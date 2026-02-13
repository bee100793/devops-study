
   #!/bin/bash

   #1, 작업장 위치 먼저 잡아두기
    cd /home/bee/02_practice

    #2.diff 사용전 현재내용파일을 가지고 있는 과거내용 파일이 없다면,만들기
     if [ ! -f old_server.log ]; then
             cp server.log old_server.log
     fi

     #3.diff 사용해서 현재파일과 과거파일 비교하는 기능 넣기
     diff --changed-group-format='%>' --unchanged-group-format='' old_server.log server.log > only_new_log.txt

     #4.diff비교로 새로운 내용만 들어있는 파일에서 '에러'잡고, 새로운 에러만 있는 파일 에 집어넣기
      grep -in "error" only_new_log.txt > new_error.log

      #5. 새로운에러만 있는 파일에 내용이 들어오면 알림보내게 하기
      if [ -s new_error.log ]; then
              error_text="$(head new_error.log)"
              message="[NEW ERROR] 새로운 에러가 발견되었습니다! \n\`\`\`\n${error_text}\n\`\`\`"
              curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"${message}\"}" hookURL
     fi

       #6. ㄱㅖ속 diff 비교를 위해 현재상태를 과거상태로 바꾸기
        cp server.log old_server.log

       #7. 디스크 용량관리와 보안 그리고 혹시모를 중복을 방지하기 위해 파일정리
       :> new_error.log
       :> only_new_log.txt
~                                                                                                                                                            ~                           
