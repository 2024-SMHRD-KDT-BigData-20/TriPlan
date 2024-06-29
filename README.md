# TriPlan 프로젝트

## 1. 프로젝트 개요 및 서비스 소개
TriPlan은 사용자 맞춤형 여행 일정 추천 및 관리 서비스입니다. 주요 기능은 다음과 같습니다:
- 사용자 맞춤형 일정 추천을 위한 여행 스타일 조사
- 장소와 사용자 여행 스타일에 태그를 부여하여 추천 알고리즘 생성
- Map API를 활용하여 생성된 일정의 위치 시각화 및 경로 표시
- 드래그 앤 드롭을 활용한 손쉬운 일정 편집

## 2. 주요 기능
- 맞춤형 자동 일정 생성
- 드래그 앤 드롭 기능
- 지도 API를 통한 위치 시각화

## 3. 개발 환경
### 프론트엔드
![HTML](https://img.shields.io/badge/HTML-5-orange)
![JavaScript](https://img.shields.io/badge/JavaScript-ES6-yellow)
![CSS](https://img.shields.io/badge/CSS-3-blue)

### 백엔드
![Servlet](https://img.shields.io/badge/Servlet-4.0-green)
![JSP](https://img.shields.io/badge/JSP-2.3-blue)
![AJAX](https://img.shields.io/badge/AJAX-ES6-yellow)
![jQuery](https://img.shields.io/badge/jQuery-3.6.0-blue)

### 데이터 & 서버
![OracleDB](https://img.shields.io/badge/OracleDB-19c-red)
![MyBatis](https://img.shields.io/badge/MyBatis-3.5.6-blue)
![Apache Tomcat](https://img.shields.io/badge/Apache%20Tomcat-9.0-orange)

### 기타
![Tmap API](https://img.shields.io/badge/Tmap%20API-v2-blue)
![GitHub](https://img.shields.io/badge/GitHub-Repository-lightgrey)
![Eclipse](https://img.shields.io/badge/Eclipse-2021--03-purple)
![VSCode](https://img.shields.io/badge/VSCode-1.58.2-blue)
![Jupyter Notebook](https://img.shields.io/badge/Jupyter%20Notebook-6.4.0-orange)

## 4. 서비스 흐름도 및 다이어그램
### 유스케이스
![유스케이스](https://github.com/2024-SMHRD-KDT-BigData-20/TriPlan/assets/162647935/05333b0f-010f-4861-9f70-251cb16a56d3)

### ER다이어그램
![ER다이어그램](https://github.com/2024-SMHRD-KDT-BigData-20/TriPlan/assets/162647935/9e572ab3-376f-4175-b54f-e5637bff7ad8)

## 5. 화면 설계도
![화면 설계도](https://github.com/2024-SMHRD-KDT-BigData-20/TriPlan/assets/160554303/998ef9cf-4788-4194-abbd-1a557a6a21bf)

## 6. 팀원 역할
- **최재민 (팀장)**
  - 프론트엔드
  - 드래그 앤 드롭
  - 발표

- **엄현식**
  - 백엔드
  - 맵 API (마커, 경로 표시 등)
  - 웹 크롤링

- **변진**
  - 백엔드
  - 일정 추천 알고리즘 구현
  - 웹 크롤링
  - DB 통신

- **김태연**
  - 프론트엔드
  - 페이지 디자인
  - 문서 작성

## 7. 트러블슈팅
### 드래그 앤 드롭
- **초기 작업**: 드래그 요소를 변수에 담아 마우스 포인터와 일치시키고, 다른 요소들과 좌표 값을 계산하여 상호작용하는 요소들끼리의 순서를 변경
- **문제점**: 다수의 요소들끼리 순서를 바꿀 수 있었지만, 가장 밑에 있는 요소나 특정 요소들은 움직이지 않거나 영향이 없는 오류 발생
- **해결 방법**: `mouseup`, `drop` 같은 `addEventListener` 함수를 사용하여 요소의 이벤트 기준으로 코드 작성
- **효과**: 코드가 직관적으로 간결해지고 복잡한 계산 코드가 필요 없어짐

### 세션 관리
- **문제점**: 로그인 사용자 정보 유지 문제
  - 세션에 저장된 VO를 불러와 관리 화면 로딩
  - 새로고침 시 DB 업데이트가 제대로 작동함에도 이전에 저장되어 있던 VO 정보로 로딩
  - 다른 트립을 선택해도 세션에 이전에 저장된 일정을 불러오는 문제 발생
- **해결 방법**: 페이지 로딩 시 인덱스를 활용한 DAO로 VO를 불러오는 방식 고려

### TMap API 호환 오류
- **문제점**: TMap API v3 사용 중 함수 호환 오류 발생
- **해결 방법**: TMap API v2로 버전으로 다운그레이드하여 해결
