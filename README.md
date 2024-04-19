# 1. 프로젝트 개요 및 서비스 소개
- 주제 : 여행 일정 추천 및 관리 서비스
- 사용자 맞춤형 일정 추천을 위한 여행 스타일 조사
- 장소와 사용자 여행 스타일에 태그를 부여하여 추천 알고리즘 생성
- Map API를 활용하여 생성된 일정의 위치 시각화 및 경로 표시
- 드래그 앤 드롭을 활용한 손쉬운 일정 편집 가능

# 2. 주요기능
 - 맞춤형 자동 일정 생성
 - 드래그 앤 드롭
 - 지도 API

# 3. 개발환경
프론트엔드 
  - HTML(Drag & Drop)
  - JS
  - CSS
  
백엔드 
  - Servlet 
  - JSP
  - AJAX
  - jQuery
  
DATA & SERVER  
  - OracleDB
  - MyBatis
  - Apache TomCat
  
etc 
  - Tmap API
  - GitHub
  - eclipse
  - VSCode
  - Jupyter Notebook

# 4. 서비스흐름도 및 다이어그램 (유스케이스, ER다이어그램)
유스케이스
![유스케이스](https://github.com/2024-SMHRD-KDT-BigData-20/TriPlan/assets/162647935/05333b0f-010f-4861-9f70-251cb16a56d3)
ER다이어그램
![ER다이어그램](https://github.com/2024-SMHRD-KDT-BigData-20/TriPlan/assets/162647935/9e572ab3-376f-4175-b54f-e5637bff7ad8)

# 5. 화면설계도
![녹화_2024_03_29_14_58_21_63 mp4_000067766](https://github.com/2024-SMHRD-KDT-BigData-20/TriPlan/assets/160554303/998ef9cf-4788-4194-abbd-1a557a6a21bf)


# 6. 팀원역할
  최재민(팀장)
  
    ∙ 프론트엔드
    ∙ 드래그 앤 드롭
    ∙ 발표
    
  엄현식
  
    ∙ 백엔드
    ∙ 맵API(마커, 경로 표시 등)
    ∙ 웹 크롤링
  
  변 진
  
    ∙ 백엔드
    ∙ 일정 추천 알고리즘 구현
    ∙ 웹 크롤링
    ∙ DB통신
 
  김태연
  
    ∙ 프론트엔드
    ∙ 페이지 디자인
    ∙ 문서작성

# 7. 트러블슈팅 (해결방안과 같이)

  Cookie, Session, Request, Page에 담은 VO를 불러올것인가?,
  페이지 로딩 시 인덱스를 활용한 DAO로 VO를 불러올 것인가?

  - 로그인 사용자 정보 유지
  - 세션에 저장된 VO를 불러와 관리 화면 로딩
  - 새로고침 시 DB업데이트가 제대로 작동함에도 이전에 저장되어있던 VO정보로 로딩
  - 다른 트립을 선택해도 세션에 이전에 저장된 일정을 불러오는 경우가 있음
