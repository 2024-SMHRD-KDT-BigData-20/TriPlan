<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>여행 스타일 조사</title>
    <style>*,
        *::before,
        *::after {
          box-sizing: border-box;
        }
        
        :root {
          --orange: #f18a0d;
          --whiteClr: #fff;
          --lightBlue: rgb(255, 255, 255);
        }
        
        :focus {
          outline: 2px solid #f8dc88;
        }
        
        html {
          line-height: 1.15;
          -webkit-text-size-adjust: 100%;
        }
        
        body {
          min-height: 100vh;
          margin: 0;
          padding: 1rem;
          /* font-family: "Roboto", sans-serif; 폰트 수정*/
          color: var(--gray);
          background-color: #eee9e0;
        }
        
        .container {
          min-height: 100vh;
          display: grid;
          grid-gap: 40px;
          align-content: center;
        }
        
        .main {
          display: block;
          align-self: start;
        }
        
        button,
        input,
        select 
        {
          /* font-family: inherit; */
          font-size: 100%;
          line-height: 1.15;
          margin: 0;
        }
        
        button,
        input {
          overflow: visible;
        }
        
        button,
        select {
          text-transform: none;
        }
 
        [type="checkbox"],
        [type="radio"] {
          box-sizing: border-box;
          padding: 0;
        }
        
        [type="number"]::-webkit-inner-spin-button,
        [type="number"]::-webkit-outer-spin-button {
          height: auto;
        }
        
        .header {
          align-self: center;
          text-align: center;
        }
        
        .header__title {
          margin: 0;
          font-size: 2em;
          line-height: 1.2;
        }
        
        .header__description {
          margin-bottom: 3rem;
          font-size: 1em;
          line-height: 1.4;
        }
        
        main.submission {
          align-self: center;
          justify-self: center;
        }
        
        h2.submission {
          text-align: center;
        }
        
        .illustration {
          width: 100%;
          border-style: none;
        }
        
        label {
          cursor: pointer;
        }
        
        @media (min-width: 700px) {
          .container {
            grid-template-columns: 1fr 1fr;
            max-width: 1400px;
            margin: 0 auto;
            align-items: center;
          }
        
          .header,
          .main {
            grid-row: 1;
          }
        }
        
        .progressbar {
          margin: 2rem 1rem 2rem;
          display: flex;
          flex-direction: row;
          justify-content: space-between;
          counter-reset: list;
          height: 20px;
        }
        
        .progressbar__step {
          position: relative;
          width: 20%;
          line-height: 1.4;
        }
        
        .progressbar__step.active:before {
          background-color: var(--orange);
        }
        
        .progressbar__step:nth-child(2)::after,
        .progressbar__step:nth-child(3)::after,
        .progressbar__step:nth-child(4)::after 
        {
          content: "";
          position: absolute;
          left: -100%;
          top: 12px;
          z-index: -1;
          width: 100%;
          height: 2px;
          background-color: var(--lightBlue);
        }
        
        .progressbar__step.active:nth-child(2)::after,
        .progressbar__step.active:nth-child(3)::after,
        .progressbar__step.active:nth-child(4)::after

        {
          background-color: var(--orange);
        }
        
        .progressbar__step:before {
          counter-increment: list;
          content: counter(list);
          position: absolute;
          display: block;
          width: 25px;
          height: 25px;
          font-size: 0.85rem;
          background-color: var(--whiteClr);
          text-align: center;
          border: 3px solid var(--lightBlue);
          border-radius: 100%;
        }
        
        .survey {
          display: flex;
          flex-direction: column;
        }
        
        .survey__panel {
          display: none;
          padding: 1rem;
        }
        
        .survey__panel--impormation {
          display: block;
        }
        
        .survey__panel__question {
          margin: 0 0 1.5rem;
          font-size: 1.35em;
          line-height: 1.2;
        }
        
        .survey__panel strong {
          --darkGrey: #4b4b4b;
          display: block;
          margin-bottom: 0.3rem;
          font-weight: normal;
          font-size: 0.95rem;
          color: var(--darkGrey);
        }
        
        .error-message {
          --errClr: #b80d57;
          height: 14px;
          margin-bottom: 0;
          margin-top: 5px;
          font-size: 0.85rem;
          color: var(--errClr);
        }
        
        [role="alert"] {
          display: block;
        }
        
        .survey__panel__period {
          display: grid;
          grid-gap: 13px;
          grid-template-columns: repeat(2, 150px);
        }
        
        .survey__panel__period [type="radio"] {
          opacity: 0;
          display: block;
          width: 150px;
          height: 50px;
          position: absolute;
          z-index: 1;
          cursor: pointer;
        }
        
        .survey__panel__period label {
          display: inline-block;
          position: relative;
          width: 150px;
          padding: 15px 30px;
          border: 2px solid var(--lightBlue);
          text-align: center;
          border-radius: 3px;
        }
        
        .radiobox,
        .radiobox:checked,
        .radiobox:not(:checked),
        .checkbox,
        .checkbox:not(:checked) {
          opacity: 0;
        }
        
        .radiobox:checked + label,
        .radiobox:not(:checked) + label,
        .checkbox:checked + label,
        .checkbox:not(:checked) + label {
          position: relative;
          padding-left: 30px;
        }
        
        .radiobox:checked + label:before,
        .radiobox:not(:checked) + label:before,
        .checkbox:checked + label:before,
        .checkbox:not(:checked) + label:before {
          content: "";
          position: absolute;
          left: 0;
          top: 0;
          width: 18px;
          height: 18px;
          border: 1px solid #ddd;
          border-radius: 100%;
          background-color: var(--whiteClr);
        }
        
        .radiobox:checked + label:after,
        .radiobox:not(:checked) + label:after {
          content: "";
          width: 8px;
          height: 8px;
          background-color: var(--intenseBlue);
          position: absolute;
          left: 5px;
          top: 5px;
          border-radius: 100%;
          transition: transform 0.2s cubic-bezier(0.785, 0.135, 0.15, 0.86),
            opacity 0.2s cubic-bezier(0.785, 0.135, 0.15, 0.86);
        }
        
        .radiobox:not(:checked) + label:after,
        .checkbox:not(:checked) + label:after {
          opacity: 0;
          transform: scale(0);
        }
        
        .radiobox:checked + label:after,
        .checkbox:checked + label:after {
          opacity: 1;
          transform: scale(1);
        }
        
        .survey__panel--impormation label,
        .survey__panel__tourism label,
        .survey__panel__food label,
        .survey__panel__sleep label {
          line-height: 2.3;
        }
      
        .survey__panel .radiobox {
          margin-left: 10px;
        }
        
        .checkbox:checked + label:before,
        .checkbox:not(:checked) + label:before {
          border-radius: 0;
        }
        
        .checkbox:checked + label:before {
          background-color: #f18a0d ;
        }
        
        .checkbox:checked + label:after,
        .checkbox:not(:checked) + label:after {
          content: "";
          position: absolute;
          left: 4px;
          top: 7px;
          width: 2px;
          height: 2px;
          background-color: var(--whiteClr);
          box-shadow: 2px 0 0 var(--whiteClr), 4px 0 0 var(--whiteClr),
            4px -2px 0 var(--whiteClr), 4px -4px 0 var(--whiteClr),
            4px -6px 0 var(--whiteClr), 4px -8px 0 var(--whiteClr);
          transform: rotate(45deg);
          transition: transform 0.2s cubic-bezier(0.785, 0.135, 0.15, 0.86),
            opacity 0.2s cubic-bezier(0.785, 0.135, 0.15, 0.86),
            background-color 0.2s cubic-bezier(0.785, 0.135, 0.15, 0.86);
        }
     
        .form-buttons {
          display: flex;
          max-width: 400px;
          margin-left: 10px;
          margin-top: auto;
        }
        
        .button {
          --btnClr: #f18a0d ;
          display: inline-block;
          padding: 10px 25px;
          background-color: var(--btnClr);
          color: var(--whiteClr);
          border: 2px solid var(--btnClr);
          border-radius: 3px;
          font-size: 0.875rem;
          font-family: inherit;
          cursor: pointer;
        }
        
        button[disabled] {
          display: none;
        }
        
        .button {
          margin: 0 0.5rem;
        }
        
        .button:hover {
          --btnHoverClr: #f18a0d;
          background-color: var(--btnHoverClr);
          border-color: var(--btnHoverClr);
        }
        
        .visuallyhidden {
          border: 0;
          clip: rect(0 0 0 0);
          height: 1px;
          margin: -1px;
          overflow: hidden;
          padding: 0;
          position: absolute;
          white-space: nowrap;
          width: 1px;
        }
        </style>
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
          <form action="n3PreferenceCon" method="post" id="survey-form" class="survey" novalidate>
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
              <label for="companion" id="companion" class="companion">동행</label><br>
              <div class="form-group">
                  <input id="alone" type="radio" name="question_1_1" value="alone" />
                  <label for="alone">혼자</label>
                </div>
                <div class="form-group">
                  <input id="couple" type="radio" name="question_1_1" value="couple" />
                  <label for="couple">커플</label>
                </div>
                <div class="form-group">
                  <input id="friend" type="radio" name="question_1_1" value="friend" />
                  <label for="friend">친구</label>
                </div>
                <div class="form-group">
                  <input id="child" type="radio" name="question_1_1" value="child" />
                  <label for="child">아이</label>
                </div>
                <div class="form-group">
                  <input id="pet" type="radio" name="question_1_1" value="pet" />
                  <label for="pet">반려동물</label>
                </div>
                <div class="form-group">
                  <input id="parents" type="radio" name="question_1_1" value="parents" />
                  <label for="parents">부모</label>
                </div>
              <p class="error-message"></p>

              <div class="survey__panel__impormation"></div>
              <label for="transportation" id="transportation" class="transportation">이동수단</label><br>
              <div class="form-group">
                  <input id="walk" type="radio" name="question_1_2" value="walk" />
                  <label for="walk">뚜벅이</label>
                </div>
                <div class="form-group">
                  <input id="public-transport" type="radio" name="question_1_2" value="public-transport" />
                  <label for="public-transport">대중교통</label>
                </div>
                <div class="form-group">
                  <input id="car" type="radio" name="question_1_2" value="car" />
                  <label for="car">자동차</label>
                </div>
              <p class="error-message"></p>
              
              <label for="style" id="style" class="style">여행을 다닐때?</label><br>
              <div class="form-group">
                  <input id="slow" type="radio" name="question_1_3" value="slow" />
                  <label for="slow">느긋하게 다녀요</label>
                </div>
                <div class="form-group">
                  <input id="fast" type="radio" name="question_1_3" value="fast" />
                  <label for="fast">부지런히 다녀요</label>
                </div>
              <p class="error-message"></p>
            </section>
      
            <section class="survey__panel" aria-hidden="true" data-index="2" data-panel="secondPanel" data-requirement="checkbox">
              <h2 class="survey__panel__question">
                <span class="visuallyhidden">Question 2 of 4 </span>관광
              </h2>
              <div class="survey__panel__tourism">
                <div class="form-group">
                  <input type="checkbox" class="checkbox" id="activity" name="question_2" value="activity" />
                  <label for="activity">체험/액티비티</label>
                </div>
                <div class="form-group">
                  <input type="checkbox" class="checkbox" id="hotplace" name="question_2" value="hotplace" />
                  <label for="hotplace">SNS 핫플</label>
                </div>
                <div class="form-group">
                  <input type="checkbox" class="checkbox" id="famous" name="question_2" value="famous" />
                  <label for="famous">유명 관광지 필수</label>
                </div>
                <div class="form-group">
                  <input type="checkbox" class="checkbox" id="healing" name="question_2" value="healing" />
                  <label for="healing">여유롭게 힐링</label>
                </div>
                <div class="form-group">
                  <input type="checkbox" class="checkbox" id="Culture-Arts-History" name="question_2" value="Culture-Arts-History" />
                  <label for="Culture-Arts-History">문화/예술/역사</label>
                </div>
                <div class="form-group">
                  <input type="checkbox" class="checkbox" id="shopping" name="question_2" value="shopping" />
                  <label for="shopping">쇼핑은 열정적으로</label>
                </div>
                <div class="form-group">
                  <input type="checkbox" class="checkbox" id="eat" name="question_2" value="eat" />
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
                  <input type="checkbox" class="checkbox" id="Korean-food" name="question_3" value="Korean-food" />
                  <label for="Korean-food">한식</label>
                </div>
                <div class="form-group">
                  <input type="checkbox" class="checkbox" id="Japanese-food" name="question_3" value="Japanese-food" />
                  <label for="Japanese-food">일식</label>
                </div>
                <div class="form-group">
                  <input type="checkbox" class="checkbox" id="Chinese-food" name="question_3" value="Chinese-food" />
                  <label for="Chinese-food">중식</label>
                </div>
                <div class="form-group">
                  <input type="checkbox" class="checkbox" id="Western-food" name="question_3" value="Western-food" />
                  <label for="Western-food">양식</label>
                </div>
                <div class="form-group">
                  <input type="checkbox" class="checkbox" id="world-food" name="question_3" value="world-food" />
                  <label for="world-food">세계음식</label>
                </div>
                <div class="form-group">
                  <input type="checkbox" class="checkbox" id="seafood" name="question_3" value="seafood" />
                  <label for="seafood">해산물</label>
                </div>
                <div class="form-group">
                  <input type="checkbox" class="checkbox" id="meat" name="question_3" value="meat" />
                  <label for="meat">고기</label>
                </div>
                <div class="form-group">
                  <input type="checkbox" class="checkbox" id="alcohol" name="question_3" value="alcohol" />
                  <label for="alcohol">주류</label>
                </div>
                <div class="form-group">
                  <input type="checkbox" class="checkbox" id="cafe" name="question_3" value="cafe" />
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
                  <input type="checkbox" class="checkbox" id="hotel" name="question_4" value="hotel" />
                  <label for="hotel">호텔</label>
                </div>
                <div class="form-group">
                  <input type="checkbox" class="checkbox" id="resort" name="question_4" value="resort" />
                  <label for="resort">리조트</label>
                </div>
                <div class="form-group">
                  <input type="checkbox" class="checkbox" id="pension" name="question_4" value="pension" />
                  <label for="pension">펜션</label>
                </div>
                <div class="form-group">
                  <input type="checkbox" class="checkbox" id="guest-house" name="question_4" value="guest-house" />
                  <label for="guest-house">게스트하우스</label>
                </div>
                <div class="form-group">
                  <input type="checkbox" class="checkbox" id="Camping" name="question_4" value="Camping" />
                  <label for="Camping">캠핑</label>
                </div>
              </div>
            </section>

            <div class="form-buttons">
              <button class="button" type="button" name="prev" disabled="disabled" aria-label="Previous" aria-hidden="true">
                Prev
              </button>
              <button class="button" type="button" name="next" aria-label="Next" aria-hidden="false">Next</button>
              <button class="button" type="submit" id="submit" name="submit" disabled="disabled" aria-hidden="true">
                Submit
              </button>
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

  function storeInitialData() { // 각 패널에 대한 초기 데이터 수집 -> formDaa에 저장
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
    if (type === "checkbox") {
      if (formData[index].answer === undefined) {
        formData[index].answer = {
          [name]: [value]
        };
        return;
      }
      if (formData[index]["answer"][`${name}`].includes(value)) {
        const position = formData[index]["answer"][`${name}`].findIndex(
          (elem) => elem === value
        );
        formData[index]["answer"][`${name}`].splice(position, 1);
      } else {
        formData[index]["answer"][`${name}`].push(value);
      }
      return;
    }
    formData[index].answer = {
      [name]: value
    };
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
      errorElement.textContent = `Select an ${requirement} to continue.`;
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

  // submitting the form
  function handleFormSubmit(e) {
    checkRequirements();
    if (!dontSubmit) {
      e.preventDefault();
    } else {
      mainElement.classList.add("submission");
      mainElement.setAttribute("role", "alert");
      mainElement.innerHTML = `<svg width="126" height="118" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 126 118" aria-hidden="true" style="transform: translateX(50%)"><path d="M52.5 118c28.995 0 52.5-23.729 52.5-53S81.495 12 52.5 12 0 35.729 0 65s23.505 53 52.5 53z" fill="#B9CCED"/><path d="M45.726 87L23 56.877l8.186-6.105 15.647 20.74L118.766 0 126 7.192 45.726 87z" fill="#A7E9AF"/></svg>
      <h2 class="submission">Thanks for your time</h2>
      <p>The form was successfully submitted`;
      return false;
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