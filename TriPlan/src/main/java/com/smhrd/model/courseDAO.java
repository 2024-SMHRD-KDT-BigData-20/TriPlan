package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class courseDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public List<n4MyTripsVO> MyTrips(String user_id) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);//auto commit
		List<n4MyTripsVO> myTrips = sqlSession.selectList("com.smhrd.db.courseMapper.MyTrips",user_id);
		sqlSession.close();
		return myTrips;
	}

	public int createSchedule(n5CreateScheduleVO vo) {

		SqlSession session = sqlSessionFactory.openSession(true);//auto commit
		//namespace.id (id 겹치는 거 여러 파일에 있는 거 아니면 namespace 없어도 실행 됨)
		int cnt = session.insert("com.smhrd.db.courseMapper.createMySchedule", vo);

		session.close();
		return cnt;
	}

	public int createDaily(n5CreateScheduleVO vo) {
		SqlSession session = sqlSessionFactory.openSession(true);//auto commit
		int cnt = session.insert("com.smhrd.db.courseMapper.createMyDaily", vo);

		session.close();
		return cnt;
	}
	
	public PoiVO TagsPerPoi2(int poi_idx) {
		SqlSession session = sqlSessionFactory.openSession(true);//auto commit
		PoiVO TagsPerPOI = session.selectOne("com.smhrd.db.courseMapper.PoiTags2", poi_idx);
		session.close();
		return TagsPerPOI;
	}
	
	public List<PoiVO> TagsPerPoi(List<Integer> POIs) {
		SqlSession session = sqlSessionFactory.openSession(true);//auto commit
		List<PoiVO> TagsPerPOI = session.selectList("com.smhrd.db.courseMapper.PoiTags", POIs);
		session.close();
		return TagsPerPOI;
	}

	public List<autoCourseVO> importCourse(int bc_idx) {
		// TODO Auto-generated method stub
		List<autoCourseVO> dailyCourseList = null;
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		dailyCourseList = sqlSession.selectList("com.smhrd.db.courseMapper.dailyCourseList",bc_idx);
		sqlSession.close();
		return dailyCourseList;
	}
	
	public List<n5CreateScheduleVO> importMyCourse(int mt_idx) {
		// TODO Auto-generated method stub
		List<n5CreateScheduleVO> dailyCourseList = null;
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		dailyCourseList = sqlSession.selectList("com.smhrd.db.courseMapper.myDailyCourseList",mt_idx);
		sqlSession.close();
		return dailyCourseList;
	}
	
	public PoiVO myCoursePOI(int poiIdx) {
		// TODO Auto-generated method stub
		PoiVO myCoursePoi = null;
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		myCoursePoi = sqlSession.selectOne("com.smhrd.db.courseMapper.myCoursePOI",poiIdx);
		sqlSession.close();
		return myCoursePoi;
	}

	public List<n7TourCourseVO> courseMatchingBasicReq(int period) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<n7TourCourseVO> courseVO = sqlSession.selectList("com.smhrd.db.courseMapper.PotentialMatches", period);
		sqlSession.close();
		return courseVO;
	}

	public List<autoCourseVO> POIsInPotentialMatch(int bc_idx) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<autoCourseVO> POIs = sqlSession.selectList("com.smhrd.db.courseMapper.POIs", bc_idx);
		sqlSession.close();
		return POIs;
	}

	public List<tagInfoVO> relatedTags(String pfPOI) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<tagInfoVO> relatedTags = sqlSession.selectList("com.smhrd.db.courseMapper.relatedTags",pfPOI);
		sqlSession.close();
		return relatedTags;
	}

	public List<autoCourseVO> importCourseDetail(int matchingTrip) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<autoCourseVO> courseDetail = sqlSession.selectList("com.smhrd.db.courseMapper.courseDetail",matchingTrip);
		sqlSession.close();
		return courseDetail;
	}

	public int insertCourseDetail(myCourseVO myCourseDetail) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int cnt = sqlSession.insert("com.smhrd.db.courseMapper.myCourseDetail", myCourseDetail);
		sqlSession.close();
		return cnt;
	}

	public List<myCourseVO> loadMyCourse(int mt_idx) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<myCourseVO> myCourse = sqlSession.selectList("com.smhrd.db.courseMapper.loadSchedule", mt_idx);
		System.out.println("Dao에서 null 확인: " + myCourse);
		sqlSession.close();
		return myCourse;
	}

	public int updateMyCourse(myCourseVO myCourseUpdate) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int cnt = sqlSession.update("com.smhrd.db.courseMapper.myCourseUpdate", myCourseUpdate);
		sqlSession.close();
		return cnt;
	}



}
