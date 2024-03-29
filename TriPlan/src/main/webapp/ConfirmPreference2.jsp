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
<title>���� ��Ÿ�� ����</title>
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
        <h1 id="title" class="header__title">���� ��Ÿ�� ����</h1> 
        <p id="description" class="header__description">
          ���⿡ ���� ���� �ڽ��� �����ص����!
        </p>
        <img src="jeju_n3.png" alt="" aria-hidden="true" class="illustration" />
      </header>

      <main class="main">
        <form action="n7ConfirmPreferenceCon" method="post" id="survey-form" class="survey" novalidate>
          <div class="progressbar" tabindex="0" role="progressbar" aria-valuemin="1" aria-valuemax="4" aria-valuenow="1" aria-valuetext="Question 1 of 4: �⺻ ����">
            <span class="progressbar__step active" aria-hidden="true"></span>
            <span class="progressbar__step" aria-hidden="true"></span>
            <span class="progressbar__step" aria-hidden="true"></span>
            <span class="progressbar__step" aria-hidden="true"></span>
          </div>
    		
          <section class="survey__panel survey__panel--impormation" aria-hidden="false" data-index="1" data-panel="firstPanel" data-requirement="option">
              <h2 class="survey__panel__question">
                <span class="visuallyhidden">Question 1 of 4 </span> �⺻ ����
              </h2>
              <div class="survey__panel__impormation"></div>
              <div class="survey__group">
              
              <label for="companion" id="companion" class="companion">����</label><br>
                <div class="form-group1">
                <%if(people.contains("ȥ��")) {%>
                  <input id="alone" type="radio" name="question_1_1" value="ȥ��" checked="checked"/>
                  <%}else{ %>
                  <input id="alone" type="radio" name="question_1_1" value="ȥ��"/>
                  <%} %>
                  <label for="alone">ȥ��</label>
                </div>
                <div class="form-group1">
                <%if(people.contains("Ŀ��")) {%>
                  <input id="couple" type="radio" name="question_1_1" value="Ŀ��" checked="checked"/>
                <%}else{ %>
                  <input id="couple" type="radio" name="question_1_1" value="Ŀ��" />
				<%} %>
                  <label for="couple">Ŀ��</label>
                </div>
                <div class="form-group1">
                <%if(people.contains("ģ��")) {%>
                  <input id="friend" type="radio" name="question_1_1" value="ģ��" checked="checked"/>
                  <%}else{ %>
                  <input id="friend" type="radio" name="question_1_1" value="ģ��"/>
                  <%} %>
                  <label for="friend">ģ��</label>
                </div>
                <div class="form-group1">
                <%if(people.contains("�θ�")) {%>
                  <input id="parents" type="radio" name="question_1_1" value="�θ�" checked="checked" />
                  <%}else{ %>
                  <input id="parents" type="radio" name="question_1_1" value="�θ�" />
                  <%} %>
                  <label for="parents">�θ�</label>
                </div>
                <div class="form-group1">
                <%if(people.contains("�ݷ�����")) {%>
                  <input id="pet" type="radio" name="question_1_1" value="�ݷ�����" checked= "checked"/>
                  <%}else{ %>
                  <input id="pet" type="radio" name="question_1_1" value="�ݷ�����" />
                  <%} %>
                  <label for="pet">�ݷ�����</label>
                </div>
               <div class="form-group1">
               <%if(people.contains("����")) {%>
                  <input id="child" type="radio" name="question_1_1" value="���" checked= "checked"/>
                  <%}else{ %>
                  <input id="child" type="radio" name="question_1_1" value="���" />
                  <%} %>
                  <label for="child">����</label>
                </div>
              
              </div>
              <p class="error-message"></p>
  
              <div class="survey__panel__impormation"></div>
              <div class="survey__group">
              <label for="transportation" id="transportation" class="transportation">�̵�����</label><br>
                <div class="form-group1">
                  <%if(transportation.contains("�ѹ���")) {%>
                  <input id="walk" type="radio" name="question_1_2" value="�ѹ���" checked= "checked" />
                  <%}else{ %>
                  <input id="walk" type="radio" name="question_1_2" value="�ѹ���" />
                  <%} %>
                  <label for="walk">�ѹ���</label>
                </div>
                <div class="form-group1">
                <%if(transportation.contains("���߱���")) {%>
                  <input id="public-transport" type="radio" name="question_1_2" value="���߱���" checked="checked"/>
                  <%}else{ %>
                  <input id="public-transport" type="radio" name="question_1_2" value="���߱���" />
                  <%} %>
                  <label for="public-transport">���߱���</label>
                </div>
                <div class="form-group1">
                <%if(transportation.contains("����")) {%>
                  <input id="car" type="radio" name="question_1_2" value="����" checked= "checked"/>
                  <%}else{ %>
                  <input id="car" type="radio" name="question_1_2" value="����" />
                  <%} %>
                  <label for="car">�ڵ���</label>
                </div>
              </div>
              <p class="error-message"></p>
              
              <div class="survey__panel__impormation"></div>
              <div class="survey__group">
              <label for="pace" id="pace" class="pace">������ �ٴҶ�?</label><br>
                <div class="form-group1">
                 <%if(pace.contains("slow")) {%>
                  <input id="slow" type="radio" name="question_1_3" value="slow" checked= "checked"/>
                  <%}else{ %>
                  <input id="slow" type="radio" name="question_1_3" value="slow" />
                  <%} %>
                  <label for="slow">�����ϰ� �ٳ��</label>
                </div>
                <div class="form-group1">
                <%if(pace.contains("fast")) {%>
                  <input id="fast" type="radio" name="question_1_3" value="fast" checked= "checked"/>
                  <%}else{ %>
                  <input id="fast" type="radio" name="question_1_3" value="fast" />
                  <%} %>
                  <label for="fast">�������� �ٳ��</label>
                </div>
              </div>
              <p class="error-message"></p>
            </section>
      
            <section class="survey__panel" aria-hidden="true" data-index="2" data-panel="secondPanel" data-requirement="checkbox">
              <h2 class="survey__panel__question">
                <span class="visuallyhidden">Question 2 of 4 </span>����
              </h2>
              <div class="survey__panel__tourism">
                <div class="form-group">
                <%if(poi.contains("ü��/��Ƽ��Ƽ")) {%>
                  <input type="checkbox" class="checkbox" id="activity" name="question_2" value="ü��/��Ƽ��Ƽ" checked = checked/>
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="activity" name="question_2" value="ü��/��Ƽ��Ƽ" />
                  <%} %>
                  <label for="activity">ü��/��Ƽ��Ƽ</label>
                </div>
                <div class="form-group">
                <%if(poi.contains("SNS ����")) {%>
                  <input type="checkbox" class="checkbox" id="hotplace" name="question_2" value="SNS ����"  checked= "checked"/>
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="hotplace" name="question_2" value="SNS ����" />
                  <%} %>
                  <label for="hotplace">SNS ����</label>
                </div>
                <div class="form-group">
                <%if(poi.contains("���� ������ �ʼ�")) {%>
                  <input type="checkbox" class="checkbox" id="famous" name="question_2" value="���� ������ �ʼ�"  checked= "checked"/>
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="famous" name="question_2" value="���� ������ �ʼ�" />
                  <%} %>
                  <label for="famous">���� ������ �ʼ�</label>
                </div>
                <div class="form-group">
                <%if(poi.contains("�����Ӱ� ����")) {%>
                  <input type="checkbox" class="checkbox" id="healing" name="question_2" value="�����Ӱ� ����" checked= "checked"/>
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="healing" name="question_2" value="�����Ӱ� ����" />
                  <%} %>
                  <label for="healing">�����Ӱ� ����</label>
                </div>
                <div class="form-group">
                <%if(poi.contains("��ȭ/����/����")) {%>
                  <input type="checkbox" class="checkbox" id="Culture-Arts-History" name="question_2" value="��ȭ/����/����"  checked= "checked"/>
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="Culture-Arts-History" name="question_2" value="��ȭ/����/����" />
                  <%} %>
                  <label for="Culture-Arts-History">��ȭ/����/����</label>
                </div>
                <div class="form-group">
                <%if(poi.contains("������ ����������")) {%>
                  <input type="checkbox" class="checkbox" id="shopping" name="question_2" value="������ ����������" checked= "checked"/>
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="shopping" name="question_2" value="������ ����������" />
                  <%} %>
                  <label for="shopping">������ ����������</label>
                </div>
                <div class="form-group">
                <%if(poi.contains("���ຸ�� �Թ�")) {%>
                  <input type="checkbox" class="checkbox" id="eat" name="question_2" value="���ຸ�� �Թ�" checked= "checked"/>
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="eat" name="question_2" value="���ຸ�� �Թ�" />
                  <%} %>
                  <label for="eat">���ຸ�� �Թ�</label>
                </div>
              </div>
              <p class="error-message"></p>
            </section>
          
              <section class="survey__panel" aria-hidden="true" data-index="3" data-panel="thirdPanel" data-requirement="checkbox">
              <h2 class="survey__panel__question">
                <span class="visuallyhidden">Question 3 of 4 </span>����
              </h2>
              <div class="survey__panel__food">
                <div class="form-group">
                <%if(food.contains("�ѽ�")) {%>
                  <input type="checkbox" class="checkbox" id="Korean-food" name="question_3" value="�ѽ�" checked= "checked" />
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="Korean-food" name="question_3" value="�ѽ�" />
                  <%} %>
                  <label for="Korean-food">�ѽ�</label>
                </div>
                <div class="form-group">
                <%if(food.contains("�Ͻ�")) {%>
                  <input type="checkbox" class="checkbox" id="Japanese-food" name="question_3" value="�Ͻ�" checked= "checked" />
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="Japanese-food" name="question_3" value="�Ͻ�" />
                  <%} %>
                  <label for="Japanese-food">�Ͻ�</label>
                </div>
                <div class="form-group">
                <%if(food.contains("�߽�")) {%>
                  <input type="checkbox" class="checkbox" id="Chinese-food" name="question_3" value="�߽�" checked= "checked"/>
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="Chinese-food" name="question_3" value="�߽�" />
                  <%} %>
                  <label for="Chinese-food">�߽�</label>
                </div>
                <div class="form-group">
                <%if(food.contains("���")) {%>
                  <input type="checkbox" class="checkbox" id="Western-food" name="question_3" value="���" checked="checked" />
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="Western-food" name="question_3" value="���" />
                  <%} %>
                  <label for="Western-food">���</label>
                </div>
                <div class="form-group">
                <%if(food.contains("��������")) {%>
                  <input type="checkbox" class="checkbox" id="world-food" name="question_3" value="��������" checked="checked"/>
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="world-food" name="question_3" value="��������" />
                  <%} %>
                  <label for="world-food">��������</label>
                </div>
                <div class="form-group">
                <%if(food.contains("�ػ깰")) {%>
                  <input type="checkbox" class="checkbox" id="seafood" name="question_3" value="�ػ깰" checked= "checked"/>
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="seafood" name="question_3" value="�ػ깰" />
                  <%} %>
                  <label for="seafood">�ػ깰</label>
                </div>
                <div class="form-group">
                <%if(food.contains("���")) {%>
                  <input type="checkbox" class="checkbox" id="meat" name="question_3" value="���" checked= "checked" />
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="meat" name="question_3" value="���" />
                  <%} %>
                  <label for="meat">���</label>
                </div>
                <div class="form-group">
                <%if(food.contains("�ַ�")) {%>
                  <input type="checkbox" class="checkbox" id="alcohol" name="question_3" value="�ַ�" checked= "checked"/>
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="alcohol" name="question_3" value="�ַ�" />
                  <%} %>
                  <label for="alcohol">�ַ�</label>
                </div>
                <div class="form-group">
                <%if(food.contains("ī��")) {%>
                  <input type="checkbox" class="checkbox" id="cafe" name="question_3" value="ī��" checked= "checked" />
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="cafe" name="question_3" value="ī��" />
                  <%} %>
                  <label for="cafe">ī��</label>
                </div>
              </div>
              <p class="error-message"></p>
            </section>
            
            <section class="survey__panel" aria-hidden="true" data-index="4" data-panel="fourthPanel" data-requirement="checkbox">
              <h2 class="survey__panel__question">
                <span class="visuallyhidden">Question 4 of 4 </span>����
              </h2>
              <div class="survey__panel__sleep">
                <div class="form-group">
                <%if(sleep.contains("ȣ��")) {%>
                  <input type="checkbox" class="checkbox" id="hotel" name="question_4" value="ȣ��" checked= "checked"/>
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="hotel" name="question_4" value="ȣ��" />
                  <%} %>
                  <label for="hotel">ȣ��</label>
                </div>
                <div class="form-group">
                <%if(sleep.contains("����Ʈ")) {%>
                  <input type="checkbox" class="checkbox" id="resort" name="question_4" value="����Ʈ" checked= "checked" />
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="resort" name="question_4" value="����Ʈ" />
                  <%} %>
                  <label for="resort">����Ʈ</label>
                </div>
                <div class="form-group">
                <%if(sleep.contains("���")) {%>
                  <input type="checkbox" class="checkbox" id="pension" name="question_4" value="���" checked= "checked"/>
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="pension" name="question_4" value="���"/>
                  <%} %>
                  <label for="pension">���</label>
                </div>
                <div class="form-group">
                <%if(sleep.contains("�Խ�Ʈ�Ͽ콺")) {%>
                  <input type="checkbox" class="checkbox" id="guest-house" name="question_4" value="�Խ�Ʈ�Ͽ콺" checked= "checked"/>
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="guest-house" name="question_4" value="�Խ�Ʈ�Ͽ콺" />
                  <%} %>
                  <label for="guest-house">�Խ�Ʈ�Ͽ콺</label>
                </div>
                <div class="form-group">
                <%if(sleep.contains("ķ��")) {%>
                  <input type="checkbox" class="checkbox" id="Camping" name="question_4" value="ķ��" checked= "checked"/>
                  <%}else {%>
                  <input type="checkbox" class="checkbox" id="Camping" name="question_4" value="ķ��" />
                  <%} %>
                  <label for="Camping">ķ��</label>
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
        
        function storeInitialData() { // �� �гο� ���� �ʱ� ������ ���� -> formData�� ����
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
        
        function updateProgressbar() { // progressbar(�������� ���� ��Ȳ)������Ʈ
          let index = currentPanel.dataset.index;
          let currentQuestion = formData[`${parseFloat(index)}`].question;
          progressbar.setAttribute("aria-valuenow", index);
          progressbar.setAttribute("aria-valuetext", currentQuestion);
          progressbarStep[index - 1].classList.add("active");
        }
        
        function updateFormData({ target }) { // ������ ������Ʈ
          const index = +currentPanel.dataset.index;
          const { name, type, value } = target;
        
        // üũ�ڽ��� ���
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
          // ���� ��ư�� ���
          } else {
            formData[index].answer = {
              [name]: value
            };
          }
        }
        
        function updateFormDataOnPageChange(index) { // ������ ���� �� ������ ������Ʈ �Լ�
          const radiosOrCheckboxes = options[`question${index}`];
          if (radiosOrCheckboxes) {
            radiosOrCheckboxes.forEach((input) => {
              input.addEventListener("change", updateFormData);
            });
          }
        }
        
        // ������ 1���� 4������ ������ ������Ʈ ���� �߰�
        for (let i = 1; i <= 4; i++) {
          updateFormDataOnPageChange(i);
        }
        
        function showError(input, text) { // ����
          const formControl = input.parentElement;
          const errorElement = formControl.querySelector(".error-message");
          errorElement.innerText = text;
          errorElement.setAttribute("role", "alert");
          if (survey.classList.contains("form-error")) return;
          survey.classList.add("form-error");
        }
        
        function noErrors(input) { // ����X
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
            // ���� �г��� �亯�� ����, �ε����� 4�� ��� -> �ʼ� �׸� üũ
            checkRequired(question4CheckBoxes);
          } else if (formData[index].hasOwnProperty("answer") && +index === 4) {
            // ���� �г��� �亯�� �ְ�, �ε����� 4�� ��� -> �䱸���� Ȯ�� �� �� �׸� üũ
            const req = requirement.split(";");
            let data = Object.keys(formData[index].answer);
            let arr = [];
            let res;
            // �亯 ������ �˻�, �䱸���� �����ϴ��� Ȯ��
            if (
              data.length === 3 &&
              data.every((elem) => formData[index].answer.hasOwnProperty(elem))
            ) {
              survey.classList.remove("form-error");
              dontSubmit = true;
            }
          } else { // �ʼ� �׸��� �Է�X -> �����޽��� ǥ��
            errorElement.textContent = `�亯�� �������ּ���`;
            errorElement.setAttribute("role", "alert");
            survey.classList.add("form-error");
          }
        }

        function updateProgressbarBar() { // progressbar ������Ʈ
          const index = currentPanel.dataset.index;
          let currentQuestion = formData[`${parseFloat(index)}`].question;
          progressbar.setAttribute("aria-valuenow", index);
          progressbar.setAttribute("aria-valuetext", currentQuestion);
          progressbarStep[index].classList.remove("active");
        }
        
        function displayNextPanel() { // Next(����) ��ư
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
        
        function displayPrevPanel() { //Prev(����) ��ư
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