/**
 * 
 */



var alterPoi2 = [];


function printAlter4(alterPoi2,poiIdx) {
    console.log("printAlter4444444시작 ",poiIdx);
    // AlterPlace 요소에 접근
    
						
	var poiItem = document.getElementById(poiIdx);
	
	var container = poiItem.querySelector(".slideContainer");
	console.log(container);
	
	//var container = poiItem.querySelector(".slideContainer");
    
    var section = container.querySelector(".center.slider.slick-initialized.slick-slider");
   // var section = container.querySelector(".center");
	//section.className("center slider slick-initialized slick-slider")
    //section에 버튼 추가
    
    // "Previous" 버튼 생성 및 추가
var prevButton = document.createElement("button");
prevButton.className = "slick-prev slick-arrow";
prevButton.setAttribute("aria-label", "Previous");
prevButton.setAttribute("type", "button");
prevButton.style.display = "block";
prevButton.textContent = "Previous";
section.appendChild(prevButton);

// AlterPlace 내부에 있는 AlterInfo 요소에 접근
var list = section.querySelector(".slick-list");

// "Next" 버튼 생성 및 추가
var nextButton = document.createElement("button");
nextButton.className = "slick-next slick-arrow";
nextButton.setAttribute("aria-label", "Next");
nextButton.setAttribute("type", "button");
nextButton.style.display = "block";
nextButton.textContent = "Next";
list.parentNode.insertBefore(nextButton, list.nextSibling);
    

    var track = list.querySelector(".slick-track");

    // AlterTitle 요소에 접근
    
/*    var otehrpoi = slide.querySelector("otherpoi")*/
    
	console.log(track);

    // 버튼을 클릭한 대체 장소의 정보를 출력
    for(let i=0;i<alterPoi2.length;i++) {
		
		 // 대체 장소 정보를 포함하는 slick-slide div 요소를 생성합니다.
        var slickSlide = document.createElement("div");
        if(i!=2){
        slickSlide.className = "slick-slide slick-cloned";
        slickSlide.setAttribute("data-slick-index", (i-2));
        slickSlide.setAttribute("aria-hidden", "true");
        slickSlide.setAttribute("tabindex", "-1");
        slickSlide.style.width = "62px";
		}else{
			
			slickSlide.className = "slick-slide slick-current slick-active slick-center";
        slickSlide.setAttribute("data-slick-index", "0");
        slickSlide.setAttribute("aria-hidden", "false");
        slickSlide.setAttribute("role", "tabpanel");
        slickSlide.id = "slick-slide190";
        slickSlide.setAttribute("aria-describedby", "slick-slide-control190");
        slickSlide.style.width = "62px";
		/*	<div class="slick-slide slick-current slick-active slick-center" data-slick-index="0" aria-hidden="false" role="tabpanel" id="slick-slide190" aria-describedby="slick-slide-control190" style="width: 62px;"><div><div id="otherpoi1" class="otherpoi" style="width: 100%;">
									<div style="height: 70px; width: 70px">
										<!-- 이미지 삽입 -->
										<img src="http://placehold.it/350x300?text=1" draggable="false">
									</div>
									<div style="display: flex; justify-content: center; text-align: center; align-items: center;">
										<a tabindex="0" draggable="false">장소제목 들어감</a>
									</div>
								</div></div></div>*/
		}
        // 대체 장소 정보를 포함하는 otherpoi div 요소를 생성합니다.
        var otherpoiDiv = document.createElement("div");
        otherpoiDiv.className = "otherpoi";
        otherpoiDiv.style.width = "100%";

        // 이미지를 포함하는 div 요소를 생성합니다.
        var imgDiv = document.createElement("div");
        imgDiv.style.height = "70px";
        imgDiv.style.width = "70px";

        // 이미지를 생성하고 설정합니다.
        var img = document.createElement("img");
        var encodedFilename = encodeURIComponent(alterPoi2[i].poi_photo)
        img.src = "poiImgs/" + encodedFilename; // 이미지 URL 설정
        img.draggable = false;

        // 장소 제목을 포함하는 div 요소를 생성합니다.
        var titleDiv = document.createElement("div");
        titleDiv.style.display = "flex";
        titleDiv.style.justifyContent = "center";
        titleDiv.style.textAlign = "center";
        titleDiv.style.alignItems = "center";

        // 장소 제목을 생성하고 설정합니다.
        var titleAnchor = document.createElement("a");
        titleAnchor.textContent = alterPoi2[i].poi_name;
        titleAnchor.tabIndex = "-1";
        titleAnchor.draggable = false;

        // 생성한 요소들을 추가합니다.
        imgDiv.appendChild(img);
        otherpoiDiv.appendChild(imgDiv);
        titleDiv.appendChild(titleAnchor);
        otherpoiDiv.appendChild(titleDiv);
        slickSlide.appendChild(otherpoiDiv);

        // 생성한 slick-slide를 slick-track에 추가합니다.
        track.appendChild(slickSlide);
        
        
        
		/*var <div class="slick-slide slick-cloned" data-slick-index="-2" aria-hidden="true" tabindex="-1" style="width: 62px;">
		
		<div><div id="" class="otherpoi" style="width: 100%;">
		
		<div style="height: 70px; width: 70px">
			<!-- 이미지 삽입 -->
			<img src="http://placehold.it/350x300?text=1" draggable="false">
		</div>
		<div style="display: flex; justify-content: center; text-align: center; align-items: center;">
			<a tabindex="-1" draggable="false">장소제목 들어감</a>
		</div>
	</div></div></div>
		
		
        // AlterTitle에 장소 이름 출력
        var otherpoiDiv = document.createElement("div");
        otherpoiDiv.className = "otherpoi";
        otherpoiDiv.id = "otherpoi_" + poi.poi_idx; // poi_idx 값을 id로 설정

        // 이미지 div 추가
        var imgDiv = document.createElement("div");
        imgDiv.style.height = "70px";
        imgDiv.style.width = "70px";

		console.log(imgDiv)

        // 이미지 추가
        var img = document.createElement("img");
        var encodedFilename = encodeURIComponent(poi.poi_photo)
        img.src = "poiImgs/" + encodedFilename; // 이미지 URL 설정
        imgDiv.appendChild(img);
        otherpoiDiv.appendChild(imgDiv);

        // 장소 제목 추가
        var titleAnchor = document.createElement("a");
        titleAnchor.textContent = poi.poi_name; // 장소 이름 설정
        otherpoiDiv.appendChild(titleAnchor);

        // section에 otherpoiDiv 추가
        slide.appendChild(otherpoiDiv);*/
    }
}



function printAlter3(alterPoi2, poiIdx) {
    console.log("printAlter333333333333333333시작 ", poiIdx);
    
    var poiItem = document.getElementById(poiIdx);
    console.log(poiItem);
    
    var alterPlace = poiItem.querySelector(".AlterPlace");

    // 반복문을 통해 각 장소 정보를 출력
   for(let i=1; i<4; i++){
        // 새로운 이미지 요소 생성
        var img = document.createElement("img");
        var encodedFilename = encodeURIComponent(alterPoi2[i].poi_photo);
        img.src = "poiImgs/" + encodedFilename;
        img.style.height = "50px";
        img.style.width = "70px";

        // 새로운 타이틀 요소 생성
        var titleAnchor = document.createElement("a");
        titleAnchor.textContent = alterPoi2[i].poi_name;

        // 새로운 AlterInfo 요소 생성
        var newAlterInfo = document.createElement("div");
        newAlterInfo.className = "AlterInfo";

        // 이미지를 담을 div 생성하고 이미지 추가
        var newDesc = document.createElement("div");
        newDesc.className = "AlterImg";
        newDesc.appendChild(img);
        newAlterInfo.appendChild(newDesc);

        // 타이틀을 담을 div 생성하고 타이틀 추가
        var newTitle = document.createElement("div");
        newTitle.className = "AlterTitle";
        newTitle.appendChild(titleAnchor);
        newAlterInfo.appendChild(newTitle);

        // 새로운 AlterInfo를 AlterPlace에 추가
        alterPlace.appendChild(newAlterInfo);
    }
}


function printAlter2(alterPoi2) {
	    console.log("printAlter시작");
    // section 요소에 접근
    var section = document.querySelector("section.center.slider");

    // PoiVO 객체를 반복하여 처리
    alterPoi2.forEach(function(poi) {
        console.log("대체 추천 장소: ", poi.poi_name);
        // otherpoi div 요소 추가
        var otherpoiDiv = document.createElement("div");
        otherpoiDiv.className = "otherpoi";
        otherpoiDiv.id = "otherpoi_" + poi.poi_idx; // poi_idx 값을 id로 설정

        // 이미지 div 추가
        var imgDiv = document.createElement("div");
        imgDiv.style.height = "70px";
        imgDiv.style.width = "70px";

        // 이미지 추가
        var img = document.createElement("img");
        var encodedFilename = encodeURIComponent(poi.poi_photo)
        img.src = "poiImgs/" + encodedFilename; // 이미지 URL 설정
        imgDiv.appendChild(img);
        otherpoiDiv.appendChild(imgDiv);

        // 장소 제목 추가
        var titleAnchor = document.createElement("a");
        titleAnchor.textContent = poi.poi_name; // 장소 이름 설정
        otherpoiDiv.appendChild(titleAnchor);

        // section에 otherpoiDiv 추가
        section.appendChild(otherpoiDiv);

    });
}

function alter3(poiIdx){
	console.log("id확인: ",poiIdx)
	 	$.ajax({
		url : "n11alterPlaceCon",
		type : "get",
		//보내는 데이터
		//js 객체 {key:value, key:value}
		//key 값이 controller에서 name으로 인식
		//$(선택자)
		data : {
"mt_idx":366,
"currentSchedule" :JSON.stringify(saveItemOrder()),
"currentPoiIdx":poiIdx
},////
		//받아오는 데이터 타입
 		dataType : "json", 
		success : function(res){
			alterPoi2=[];
			console.log(res)
			console.log(typeof(res));
			for(let i=0; i<res.length;i++){
				alterPoi2.push(res[i]);
			}
			console.log("대체장소",alterPoi2);
			printAlter4(alterPoi2,poiIdx);
		},
		 error: function(){
			alert("통신 실패")
		} 
/* 		 error: function(xhr, status, error){
		     console.log(xhr);
		     console.log(status);
		    // console.log(error);
			 alert("Error!" + xhr.status);
		    }, */
	}); //ajax 끝 
		return poiIdx;
	}




function alter2(poiIdx){
	console.log("id확인: ",poiIdx)
	 	$.ajax({
		url : "n11alterPlaceCon",
		type : "get",
		//보내는 데이터
		//js 객체 {key:value, key:value}
		//key 값이 controller에서 name으로 인식
		//$(선택자)
		data : {
"mt_idx":366,
"currentSchedule" :JSON.stringify(saveItemOrder()),
"currentPoiIdx":poiIdx
},////
		//받아오는 데이터 타입
 		dataType : "json", 
		success : function(res){
			alterPoi2=[];
			console.log(res)
			console.log(typeof(res));
			for(let i=0; i<res.length;i++){
				alterPoi2.push(res[i]);
			}
			console.log("대체장소",alterPoi2);
			printAlter3(alterPoi2,poiIdx);
		},
		 error: function(){
			alert("통신 실패")
		} 
/* 		 error: function(xhr, status, error){
		     console.log(xhr);
		     console.log(status);
		    // console.log(error);
			 alert("Error!" + xhr.status);
		    }, */
	}); //ajax 끝 
		return alterPoi2;
	}

