#!/bin/bash



  #1. 위치 고정
  cd "$(dirname "$0")"

  echo " git pull 업데이트를 시작합니다.["$(date)"] "


  #2. 충동방지 3단계 콤보 (서버는 작업하는 곳이 아니라 작업물있으면 지워야함)
  git checkout .   # 누군가 파일 건들였으면 건들기전으로 원상복구
  git clean -fd     #혹시 새로생긴 것 있으면 강제 삭제

  git pull origin main #오리진(사이트) 메인브랜치에 있는 최신 코드 가져오기

  echo " 업데이트 완료 "
