create table EHS(
	id varchar2(20)
);

select * from EHS;


CREATE TABLE poi_info_test AS SELECT * FROM poi_info;
CREATE TABLE test_daily AS SELECT * FROM daily_schedule_info;
CREATE TABLE test_tour AS SELECT * FROM tour_course_info;





select * from poi_info_test;
select * from test_daily;
select * from test_tour;

insert into test_tour values ('1','서북지역 뚜벅이 여행','4','#친구 #천천히 걷기 #휴식/힐링/건강','2','C:\Users\smart\Desktop\ProjectTriPlan\DB\CourseImg\1-서북지역 뚜벅이 여행.jpg');

insert into test_daily values ('1.1','1','1','10001');
insert into test_daily values ('1.2','1','2','10002-10003-10004');
insert into test_daily values ('1.3','1','3','10005-10006');
insert into test_daily values ('1.4','1','4','10007-10008-10009-10001');

insert into poi_info_test values('10001','제주국제공항','제주특별자치도 제주시 공항로 2','동북아의 중심에서 일본, 중국, 동남아를 연결하는 제주국제공항','33.5','126.5','#공항 #제주국제공항 #실내관광지','-','-');
insert into poi_info_test values('10002','애월한담해안산책로','제주특별자치도 제주시 애월읍 곽지리 1359','해안선을 따라 걷는 구불구불 해안길.','33.5','126.5','#해변 #걷기/등산 #친구','-','-');
insert into poi_info_test values('10003','애월 한담 카약','제주 제주시 애월읍 애월로1길 25','애월 한담 해수욕장 부근에서 즐길 수 있는 투명카약.','33.5','126.5','#해수욕장 #액티비티 #커플','-','-');
insert into poi_info_test values('10004','제주올레 15-A코스','제주특별자치도 제주시 애월읍 납읍리 2695-5','숲의 경쾌함과 바다의 청량함을 모두 느낄 수 있는 길','33.5','126.5','#커플 #혼자 #친구','-','-');
insert into poi_info_test values('10005','협재해수욕장','제주특별자치도 제주시 한림읍 한림로 329-10','비양도, 은모래, 바다가 그려낸 그림같이 아름다운 해변','33.5','126.5','#일몰 #해수욕장 #액티비티','-','-');
insert into poi_info_test values('10006','비양도','제주특별자치도 제주시 한림읍 협재리','천 년의 시간을 간직한 섬 · 천연기념물 제439호 · 제주도기념물 제48호 · 올레15코스','33.5','126.5','#섬속의섬 #일몰 #휴식/힐링','평일 : 08:30 ~ 17:30 , 주말 : 08:30 ~ 17:30','-');
insert into poi_info_test values('10007','아라리오뮤지엄동문모텔1','제주특별자치도 제주시 산지로 37-5','국내외 현대미술품들을 소개하고 관람객들과 예술적 경험을 함께 향유하는 컨템포러리 아트뮤지엄','33.5','126.5','#실내 #미술/박물관 #비.눈','평일 : 10:00 ~ 19:00 , 주말 : 10:00 ~ 19:00','-');
insert into poi_info_test values('10008','아라리오뮤지엄동문모텔2','제주특별자치도 제주시 산지로 23','국내외 현대미술품들을 소개하고 관람객들과 예술적 경험을 함께 향유하는 컨템포러리 아트뮤지엄','33.5','126.5','#실내 #미술/박물관 #비.눈','평일 : 10:00 ~ 19:00 , 주말 : 10:00 ~ 19:00','-');
insert into poi_info_test values('10009','용두암','제주특별자치도 제주시 용두암길 15','용이 승천하려다 뜻을 이루지 못했다는 전설을 담고 있는 곳 · 제주도기념물 제57호 · 올레17코스','33.5','126.5','#공영관광지 #일출 #해변','평일 : 00:00 ~ 00:00 , 주말 : 00:00 ~ 00:00','-');