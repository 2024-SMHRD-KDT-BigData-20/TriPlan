package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class courseDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

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

	public List<autoCourseVO> importCourse(int bc_idx) {
		// TODO Auto-generated method stub
		List<autoCourseVO> dailyCourseList = null;
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		dailyCourseList = sqlSession.selectList("com.smhrd.db.courseMapper.dailyCourseList",bc_idx);
		return dailyCourseList;
	}
	
	public List<n5CreateScheduleVO> importMyCourse(int mt_idx) {
		// TODO Auto-generated method stub
		List<n5CreateScheduleVO> dailyCourseList = null;
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		dailyCourseList = sqlSession.selectList("com.smhrd.db.courseMapper.myDailyCourseList",mt_idx);
		return dailyCourseList;
	}
	
	public PoiVO myCoursePOI(int poiIdx) {
		// TODO Auto-generated method stub
		PoiVO myCoursePoi = null;
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		myCoursePoi = sqlSession.selectOne("com.smhrd.db.courseMapper.myCoursePOI",poiIdx);
		return myCoursePoi;
	}

	public List<autoCourseVO> courseMatchingBasicReq(int period) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<String> POIsInPotentialMatch() {
		// TODO Auto-generated method stub
		return null;
	}



}
