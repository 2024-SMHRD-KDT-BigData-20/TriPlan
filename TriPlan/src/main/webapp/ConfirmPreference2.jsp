<%@page import="com.smhrd.model.n1UserDAO"%>
<%@page import="com.smhrd.model.n1UserVO"%>
<%@page import="com.smhrd.model.n3PreferenceVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>여행 스타일 조사</title>
<link rel="stylesheet" href="assets/css/n3Preference.css">
<%
n1UserVO user = (n1UserVO)session.getAttribute("loginUserVO");
String user_id = user.getUser_id();
n1UserDAO dao = new n1UserDAO();
n3PreferenceVO preferenceVO = dao.PreferenceToPrint(user_id);
//n3PreferenceVO preferenceVO = (n3PreferenceVO)session.getAttribute("userPreference"); 
System.out.println(preferenceVO.toString());
System.out.println(preferenceVO.getPeople());
String people = preferenceVO.getPeople();
String transportation = preferenceVO.getTransportation();
String pace = preferenceVO.getPace();
String poi = preferenceVO.getPoi();
String food = preferenceVO.getFood();
String sleep = preferenceVO.getSleep();


%>
</head>
<body>
    <div class="container">
      <header class="header">
        <h1 id="title" class="header__title">여행 스타일 조사</h1> 
        <p id="description" class="header__description">
          취향에 맞춰 여행 코스를 생성해드려요!
        </p>
        <img src="jeju_n3.png" alt="" aria-hidden="true" class="illustration" />
      </header>

      <main class="main">
        <form action="n7ConfirmPreferenceCon" method="post" id="survey-form" class="survey" novalidate>
          <div class="progressbar" tabindex="0" role="progressbar" aria-valuemin="1" aria-valuemax="4" aria-valuenow="1" aria-valuetext="Question 1 of 4: 기본 정보">
            <span class="progressbar__step active" aria-hidden="true"></span>
            <span class="progressbar__step" aria-hidden="true"></span>
            <span class="progressbar__step" aria-hidden="true"></span>
            <span class="progressbar__step" aria-hidden="true"></span>
          </div>
    		
          <section class="survey__panel survey__panel--impormation" aria-hidden="false" data-index="1" data-panel="firstPanel" data-requirement="option">
              <h2 class="survey__panel__question">
                <span class="visuallyhidden">Question 1 of 4 </span> 기본 정보
              </h2>
              <div class="survey__panel__impormation"></div>
              <div class="survey__group">
              
              <label for="companion" id="companion" class="companion">동행</label><br>
                <div class="form-group1">
                <%if(people.contains("혼자")) {%>
                  <input id="alone" type="radio" name="question_1_1" value="혼자" checked="checked"/>
                  <%}else{ %>
                  <input id="alone" type="radio" name="question_1_1" value="혼자"/>
                  <%} %>
                  <label for="alone">혼자</label>
                </div>
                <div class="form-group1">
                <%if(people.contains("커플")) {%>
                  <input id="couple" type="radio" name="question_1_1" value="커플" checked="checked"/>
                <%}else{ %>
                  <input id="couple" type="radio" name="question_1_1" value="커플" />
				<%} %>
                  <label for="couple">커플</label>
                </div>
                <div class="form-group1">
                <%if(people.contains("친구")) {%>
                  <input id="friend" type="radio" name="question_1_1" value="친구" checked="checked"/>
                  <%}else{ %>
                  <input id="friend" type="radio" name="question_1_1" value="친구"/>
                  <%} %>
                  <label for="friend">친구</label>
                </div>
                <div class="form-group1">
                <%if(people.contains("부모")) {%>
                  <input id="parents" type="radio" name="question_1_1" value="부모" checked="checked" />
                  <%}else{ %>
                  <input id="parents" type="radio" name="question_1_1" value="부모" />
                  <%} %>
                  <label for="parents">부모</label>
                </div>
                <div class="form-group1">
                <%if(people.contains("반려동물")) {%>
                  <input id="pet" type="radio" name="question_1_1" value="반려동물" checked= "checked"/>
                  <%}else{ %>
                  <input id="pet" type="radio" name="question_1_1" value="반려동물" />
                  <%} %>
                  <label for="pet">반려동물</label>
                </div>
               <div class="form-group1">
               <%if(people.contains("아이")) {%>
                  <input id="child" type="radio" name="question_1_1" value="어린이" checked= "checked"/>
                  <%}else{ %>
                  <input id="child" type="radio" name="question_1_1" value="어린이" />
                  <%} %>
                  <label for="child">아이</label>
                </div>
              
              </div>
              <p class="error-message"></p>
  
              <div class="survey__panel__impormation"></div>
              <div class="survey__group">
              <label for="transportation" id="transportation" class="transportation">이동수단</label><br>
                <div class="form-group1">
                  <%if(transportation.contains("뚜벅이")) {%>
                  <input id="walk" type="radio" name="question_1_2" value="뚜벅이" checked= "checked" />
                  <%}else{ %>
                  <input id="walk" type="radio" name="question_1_2" value="뚜벅이" />
                  <%} %>
                  <label for="walk">뚜벅이</label>
                </div>
                <div class="form-group1">
                <%if(transportation.contains("대중교통")) {%>
                  <input id="public-transport" type="radio" name="question_1_2" value="대중교통" checked="checked"/>
                  <%}else{ %>
                  <input id="public-transport" type="radio" name="question_1_2" value="대중교통" />
                  <%} %>
                  <label for="public-transport">대중교통</label>
                </div>
                <div class="form-group1">
                <%if(transportation.contains("주차")) {%>
                  <input id="car" type="radio" name="question_1_2" value="주차" checked= "checked"/>
                  <%}else{ %>
                  <input id="car" type="radio" name="question_1_2" value="주차" />
                  <%} %>
                  <label for="car">자동차</label>
                </div>
              </div>
              <p class="error-message"></p>
              
              <div class="survey__panel__impormation"></div>
              <div class="survey__group">
              <label for="pace" id="pace" class="pace">여행을 다닐때?</label><br>
                <div class="form-group1">
                 <%if(pace.contains("slow")) {%>
                  <input id="slow" type="radio" name="question_1_3" value="slow" checked= "checked"/>
                  <%}else{ %>
                  <input id="slow" type="radio" name="question_1_3" value="slow" />
                  <%} %>
                  <label for="slow">느긋하게 다녀요</label>
                </div>
                <div class="form-group1">
                <%if(pace.contains("fast")) {%>
                  <input id="fast" type="radio" name="question_1_3" value="fast" checked= "checked"/>
                  <%}else{ %>
                  <input id="fast" type="radio" name="question_1_3" value="fast" />
                  <%} %>
                  <label for="fast">부지런히 다녀요</label>
                </div>
              </div>
              <p class="error-message"></p>
            </section>
      
            <section class="survey__panel" aria-hidden="true" data-index="2" data-panel="secondPanel" data-requirement="checkbox">
              <h2 class="survey__panel__question">
                <span class="visuallyhidden">Question 2 of 4 </span>관광
              </h2>
              <div class="survey__panel__tourism">
                <div class="form-group">
                <%if(poi.contains("체험/액티비티")) {%>
                  <input type="checkbox" class="checkbox" id="activity" name="question_2" value="체험/액티비티" checked = checked/>
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="activity" name="question_2" value="체험/액티비티" />
                  <%} %>
                  <label for="activity">체험/액티비티</label>
                </div>
                <div class="form-group">
                <%if(poi.contains("SNS 핫플")) {%>
                  <input type="checkbox" class="checkbox" id="hotplace" name="question_2" value="SNS 핫플"  checked= "checked"/>
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="hotplace" name="question_2" value="SNS 핫플" />
                  <%} %>
                  <label for="hotplace">SNS 핫플</label>
                </div>
                <div class="form-group">
                <%if(poi.contains("유명 관광지 필수")) {%>
                  <input type="checkbox" class="checkbox" id="famous" name="question_2" value="유명 관광지 필수"  checked= "checked"/>
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="famous" name="question_2" value="유명 관광지 필수" />
                  <%} %>
                  <label for="famous">유명 관광지 필수</label>
                </div>
                <div class="form-group">
                <%if(poi.contains("여유롭게 힐링")) {%>
                  <input type="checkbox" class="checkbox" id="healing" name="question_2" value="여유롭게 힐링" checked= "checked"/>
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="healing" name="question_2" value="여유롭게 힐링" />
                  <%} %>
                  <label for="healing">여유롭게 힐링</label>
                </div>
                <div class="form-group">
                <%if(poi.contains("문화/예술/역사")) {%>
                  <input type="checkbox" class="checkbox" id="Culture-Arts-History" name="question_2" value="문화/예술/역사"  checked= "checked"/>
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="Culture-Arts-History" name="question_2" value="문화/예술/역사" />
                  <%} %>
                  <label for="Culture-Arts-History">문화/예술/역사</label>
                </div>
                <div class="form-group">
                <%if(poi.contains("쇼핑은 열정적으로")) {%>
                  <input type="checkbox" class="checkbox" id="shopping" name="question_2" value="쇼핑은 열정적으로" checked= "checked"/>
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="shopping" name="question_2" value="쇼핑은 열정적으로" />
                  <%} %>
                  <label for="shopping">쇼핑은 열정적으로</label>
                </div>
                <div class="form-group">
                <%if(poi.contains("여행보다 먹방")) {%>
                  <input type="checkbox" class="checkbox" id="eat" name="question_2" value="여행보다 먹방" checked= "checked"/>
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="eat" name="question_2" value="여행보다 먹방" />
                  <%} %>
                  <label for="eat">여행보다 먹방</label>
                </div>
              </div>
              <p class="error-message"></p>
            </section>
          
              <section class="survey__panel" aria-hidden="true" data-index="3" data-panel="thirdPanel" data-requirement="checkbox">
              <h2 class="survey__panel__question">
                <span class="visuallyhidden">Question 3 of 4 </span>음식
              </h2>
              <div class="survey__panel__food">
                <div class="form-group">
                <%if(food.contains("한식")) {%>
                  <input type="checkbox" class="checkbox" id="Korean-food" name="question_3" value="한식" checked= "checked" />
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="Korean-food" name="question_3" value="한식" />
                  <%} %>
                  <label for="Korean-food">한식</label>
                </div>
                <div class="form-group">
                <%if(food.contains("일식")) {%>
                  <input type="checkbox" class="checkbox" id="Japanese-food" name="question_3" value="일식" checked= "checked" />
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="Japanese-food" name="question_3" value="일식" />
                  <%} %>
                  <label for="Japanese-food">일식</label>
                </div>
                <div class="form-group">
                <%if(food.contains("중식")) {%>
                  <input type="checkbox" class="checkbox" id="Chinese-food" name="question_3" value="중식" checked= "checked"/>
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="Chinese-food" name="question_3" value="중식" />
                  <%} %>
                  <label for="Chinese-food">중식</label>
                </div>
                <div class="form-group">
                <%if(food.contains("양식")) {%>
                  <input type="checkbox" class="checkbox" id="Western-food" name="question_3" value="양식" checked="checked" />
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="Western-food" name="question_3" value="양식" />
                  <%} %>
                  <label for="Western-food">양식</label>
                </div>
                <div class="form-group">
                <%if(food.contains("세계음식")) {%>
                  <input type="checkbox" class="checkbox" id="world-food" name="question_3" value="세계음식" checked="checked"/>
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="world-food" name="question_3" value="세계음식" />
                  <%} %>
                  <label for="world-food">세계음식</label>
                </div>
                <div class="form-group">
                <%if(food.contains("해산물")) {%>
                  <input type="checkbox" class="checkbox" id="seafood" name="question_3" value="해산물" checked= "checked"/>
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="seafood" name="question_3" value="해산물" />
                  <%} %>
                  <label for="seafood">해산물</label>
                </div>
                <div class="form-group">
                <%if(food.contains("고기")) {%>
                  <input type="checkbox" class="checkbox" id="meat" name="question_3" value="고기" checked= "checked" />
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="meat" name="question_3" value="고기" />
                  <%} %>
                  <label for="meat">고기</label>
                </div>
                <div class="form-group">
                <%if(food.contains("주류")) {%>
                  <input type="checkbox" class="checkbox" id="alcohol" name="question_3" value="주류" checked= "checked"/>
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="alcohol" name="question_3" value="주류" />
                  <%} %>
                  <label for="alcohol">주류</label>
                </div>
                <div class="form-group">
                <%if(food.contains("카페")) {%>
                  <input type="checkbox" class="checkbox" id="cafe" name="question_3" value="카페" checked= "checked" />
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="cafe" name="question_3" value="카페" />
                  <%} %>
                  <label for="cafe">카페</label>
                </div>
              </div>
              <p class="error-message"></p>
            </section>
            
            <section class="survey__panel" aria-hidden="true" data-index="4" data-panel="fourthPanel" data-requirement="checkbox">
              <h2 class="survey__panel__question">
                <span class="visuallyhidden">Question 4 of 4 </span>숙소
              </h2>
              <div class="survey__panel__sleep">
                <div class="form-group">
                <%if(sleep.contains("호텔")) {%>
                  <input type="checkbox" class="checkbox" id="hotel" name="question_4" value="호텔" checked= "checked"/>
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="hotel" name="question_4" value="호텔" />
                  <%} %>
                  <label for="hotel">호텔</label>
                </div>
                <div class="form-group">
                <%if(sleep.contains("리조트")) {%>
                  <input type="checkbox" class="checkbox" id="resort" name="question_4" value="리조트" checked= "checked" />
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="resort" name="question_4" value="리조트" />
                  <%} %>
                  <label for="resort">리조트</label>
                </div>
                <div class="form-group">
                <%if(sleep.contains("펜션")) {%>
                  <input type="checkbox" class="checkbox" id="pension" name="question_4" value="펜션" checked= "checked"/>
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="pension" name="question_4" value="펜션"/>
                  <%} %>
                  <label for="pension">펜션</label>
                </div>
                <div class="form-group">
                <%if(sleep.contains("게스트하우스")) {%>
                  <input type="checkbox" class="checkbox" id="guest-house" name="question_4" value="게스트하우스" checked= "checked"/>
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="guest-house" name="question_4" value="게스트하우스" />
                  <%} %>
                  <label for="guest-house">게스트하우스</label>
                </div>
                <div class="form-group">
                <%if(sleep.contains("캠핑")) {%>
                  <input type="checkbox" class="checkbox" id="Camping" name="question_4" value="캠핑" checked= "checked"/>
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="Camping" name="question_4" value="캠핑" />
                  <%} %>
                  <label for="Camping">캠핑</label>
                </div>
              </div>
              <p class="error-message"></p>
            </section>
  
            <div class="form-buttons">
              <button class="button" type="button" name="prev" disabled="disabled" aria-label="Previous" aria-hidden="true">Prev</button>
              <button class="button" type="button" name="next" aria-label="Next" aria-hidden="false">Next</button>
              <button class="button" type="submit" id="submit" name="submit" disabled="disabled" aria-hidden="true">Submit</button>
            </div>
          </form>
        </main>
      </div>
  <script>

      function Survey(survey) {
        if (!survey) {
          throw new Error("No Survey Form found!");
        }


        // select the elements
        
        const progressbar = survey.querySelector(".progressbar");
        const surveyPanels = survey.querySelectorAll(".survey__panel");
        const question1_1Radios = survey.querySelectorAll("[name='question_1_1']");
        const question1_2Radios = survey.querySelectorAll("[name='question_1_2']");
        const question1_3Radios = survey.querySelectorAll("[name='question_1_3']");
        const question2CheckBoxes = survey.querySelectorAll("[name='question_2']");
        const question3CheckBoxes = survey.querySelectorAll("[name='question_3']");
        const question4CheckBoxes = survey.querySelectorAll("[name='question_4']");
        const allPanels = Array.from(survey.querySelectorAll(".survey__panel"));
        let progressbarStep = Array.from(
          progressbar.querySelectorAll(".progressbar__step ")
        );
        const mainElement = document.querySelector("main");
        const nextButton = survey.querySelector("[name='next']");
        const prevButton = survey.querySelector("[name='prev']");
        const submitButton = survey.querySelector("[name='submit']");
        let currentPanel = Array.from(surveyPanels).filter((panel) =>
        panel.classList.contains("survey__panel--impormation")
        )[0];
        const formData = {};
        const options = {
          question1_1Radios,
          question1_2Radios,
          question1_3Radios,
          question2CheckBoxes,
          question3CheckBoxes,
          question4CheckBoxes
          };
        let dontSubmit = false;
        
        function storeInitialData() { // 각 패널에 대한 초기 데이터 수집 -> formData에 저장
          allPanels.map((panel) => {
            let index = panel.dataset.index;
            let panelName = panel.dataset.panel;
            let question = panel
              .querySelector(".survey__panel__question")
              .textContent.trim();
            formData[index] = {
              panelName: panelName,
              question: question
            };
          });
        }
        
        function updateProgressbar() { // progressbar(설문조사 진행 상황)업데이트
          let index = currentPanel.dataset.index;
          let currentQuestion = formData[`${parseFloat(index)}`].question;
          progressbar.setAttribute("aria-valuenow", index);
          progressbar.setAttribute("aria-valuetext", currentQuestion);
          progressbarStep[index - 1].classList.add("active");
        }
        
        function updateFormData({ target }) { // 데이터 업데이트
          const index = +currentPanel.dataset.index;
          const { name, type, value } = target;
        
        // 체크박스인 경우
        if (type === "checkbox") {
            if (formData[index].answer === undefined) {
              formData[index].answer = {
                [name]: [value]
              };
            } else {
              if (formData[index]["answer"][`${name}`].includes(value)) {
                const position = formData[index]["answer"][`${name}`].findIndex(
                  (elem) => elem === value
                );
                formData[index]["answer"][`${name}`].splice(position, 1);
              } else {
                formData[index]["answer"][`${name}`].push(value);
              }
            }
          // 라디오 버튼인 경우
          } else {
            formData[index].answer = {
              [name]: value
            };
          }
        }
        
        function updateFormDataOnPageChange(index) { // 페이지 변경 시 데이터 업데이트 함수
          const radiosOrCheckboxes = options[`question${index}`];
          if (radiosOrCheckboxes) {
            radiosOrCheckboxes.forEach((input) => {
              input.addEventListener("change", updateFormData);
            });
          }
        }
        
        // 페이지 1부터 4까지의 데이터 업데이트 로직 추가
        for (let i = 1; i <= 4; i++) {
          updateFormDataOnPageChange(i);
        }
        
        function showError(input, text) { // 에러
          const formControl = input.parentElement;
          const errorElement = formControl.querySelector(".error-message");
          errorElement.innerText = text;
          errorElement.setAttribute("role", "alert");
          if (survey.classList.contains("form-error")) return;
          survey.classList.add("form-error");
        }
        
        function noErrors(input) { // 에러X
          if (!input) {
            const errorElement = currentPanel.querySelector(".error-message");
            errorElement.textContent = "";
            errorElement.removeAttribute("role");
            survey.classList.remove("form-error");
            return;
          }
          const formControl = input.parentElement;
          const errorElement = formControl.querySelector(".error-message");
          errorElement.innerText = "";
          errorElement.removeAttribute("role");
        }
        
        function checkRequired(input) {
          if (input.value.trim() === "") {
            showError(input, `${getName(input)} is required`);
          } else {
            noErrors(input);
          }
        }
        
        function checkSelection(input) {
          if (input.selectedIndex === 0) {
            showError(input, `${getName(input)} is required`);
          } else {
            noErrors(input);
          }
        }
        
        function checkRequirements() {
          const requirement = currentPanel.dataset.requirement;
          const index = currentPanel.dataset.index;
          const errorElement = currentPanel.querySelector(".error-message");
        
          if (!formData[index].hasOwnProperty("answer") && +index === 4) { 
            // 현재 패널의 답변이 없고, 인덱스가 4인 경우 -> 필수 항목 체크
            checkRequired(question4CheckBoxes);
          } else if (formData[index].hasOwnProperty("answer") && +index === 4) {
            // 현재 패널의 답변이 있고, 인덱스가 4인 경우 -> 요구사항 확인 및 각 항목 체크
            const req = requirement.split(";");
            let data = Object.keys(formData[index].answer);
            let arr = [];
            let res;
            // 답변 데이터 검사, 요구사항 충족하는지 확인
            if (
              data.length === 3 &&
              data.every((elem) => formData[index].answer.hasOwnProperty(elem))
            ) {
              survey.classList.remove("form-error");
              dontSubmit = true;
            }
          } else { // 필수 항목이 입력X -> 오류메시지 표시
            errorElement.textContent = `답변을 선택해주세요`;
            errorElement.setAttribute("role", "alert");
            survey.classList.add("form-error");
          }
        }

        function updateProgressbarBar() { // progressbar 업데이트
          const index = currentPanel.dataset.index;
          let currentQuestion = formData[`${parseFloat(index)}`].question;
          progressbar.setAttribute("aria-valuenow", index);
          progressbar.setAttribute("aria-valuetext", currentQuestion);
          progressbarStep[index].classList.remove("active");
        }
        
        function displayNextPanel() { // Next(다음) 버튼
          currentPanel.classList.remove("survey__panel--impormation");
          currentPanel.setAttribute("aria-hidden", true);
          currentPanel = currentPanel.nextElementSibling;
          currentPanel.classList.add("survey__panel--impormation");
          currentPanel.setAttribute("aria-hidden", false);
          updateProgressbar();
          if (+currentPanel.dataset.index > 1) {
            prevButton.disabled = false;
            prevButton.setAttribute("aria-hidden", false);
          }
          if (+currentPanel.dataset.index === 4) {
            nextButton.disabled = true;
            nextButton.setAttribute("aria-hidden", true);
            submitButton.disabled = false;
            submitButton.setAttribute("aria-hidden", false);
          }
        }
        
        function displayPrevPanel() { //Prev(이전) 버튼
          currentPanel.classList.remove("survey__panel--impormation");
          currentPanel.setAttribute("aria-hidden", true);
          currentPanel = currentPanel.previousElementSibling;
          currentPanel.classList.add("survey__panel--impormation");
          currentPanel.setAttribute("aria-hidden", false);
          updateProgressbarBar();
          if (+currentPanel.dataset.index === 1) {
            prevButton.disabled = true;
            prevButton.setAttribute("aria-hidden", true);
          }
          if (+currentPanel.dataset.index < 4) {
            nextButton.disabled = false;
            nextButton.setAttribute("aria-hidden", false);
            submitButton.disabled = true;
            submitButton.setAttribute("aria-hidden", true);
          }
        }
        
        function handleprevButton() {
          displayPrevPanel();
        }
        
        function handleNextButton() {
          const index = currentPanel.dataset.index;
          if (!formData[index].hasOwnProperty("answer")) {
            checkRequirements();
          } else {
            noErrors();
            displayNextPanel();
          }
        }
        
        storeInitialData();
        
        function addListenersTo({
          question1_1Radios,
          question1_2Radios,
          question1_3Radios,
          question2CheckBoxes,
          question3CheckBoxes,
          question4CheckBoxes,
          ...inputs
        }) {
          question1_1Radios.forEach((elem) =>
            elem.addEventListener("change", updateFormData)
          );
          question1_2Radios.forEach((elem) =>
            elem.addEventListener("change", updateFormData)
          );
          question1_3Radios.forEach((elem) =>
          elem.addEventListener("change", updateFormData)
           );
          question2CheckBoxes.forEach((elem) =>
            elem.addEventListener("change", updateFormData)
          );
          question3CheckBoxes.forEach((elem) =>
            elem.addEventListener("change", updateFormData)
          );
          question4CheckBoxes.forEach((elem) =>
            elem.addEventListener("change", updateFormData)
          );
        }
        nextButton.addEventListener("click", handleNextButton);
        prevButton.addEventListener("click", handleprevButton);
        addListenersTo(options);
        survey.addEventListener("submit", handleFormSubmit);
        }
        
        const survey = Survey(document.querySelector(".survey"));
        
            </script>
        
        </body>
        </html>