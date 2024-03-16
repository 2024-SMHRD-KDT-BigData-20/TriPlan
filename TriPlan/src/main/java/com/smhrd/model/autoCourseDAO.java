package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class autoCourseDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public List<autoCourseVO> importCourse(int courseID) {
		// TODO Auto-generated method stub
		List<autoCourseVO> dailyCourseList = null;
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		dailyCourseList = sqlSession.selectList("com.smhrd.db.courseMapper.dailyCourseList",courseID);
		return dailyCourseList;
	}

}
