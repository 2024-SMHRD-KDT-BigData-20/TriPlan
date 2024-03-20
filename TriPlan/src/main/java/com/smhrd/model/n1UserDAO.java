package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class n1UserDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public int Join(n1UserVO joinUser) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);//auto commit
		
		int cnt = sqlSession.insert("com.smhrd.db.UserMapper.Join", joinUser);
		sqlSession.close();
		return cnt;
	}
	
	public n1UserVO Login(n1UserVO login) {
		n1UserVO loginVO = null;
		SqlSession sqlSession = sqlSessionFactory.openSession(true);//auto commit
		
		loginVO = sqlSession.selectOne("com.smhrd.db.UserMapper.Login",login);
		
		
		sqlSession.close();
		return loginVO;
	}

	public List<n4MyTripsVO> MyTrips(String user_id) {

		List<n4MyTripsVO> myTrips = null;
		SqlSession sqlSession = sqlSessionFactory.openSession(true);//auto commit
		myTrips = sqlSession.selectList("com.smhrd.db.UserMapper.MyTrips",user_id);
		
		return myTrips;
	}

	public int insertPreference(n3PreferenceVO preference) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);//auto commit
		
		int cnt = sqlSession.insert("com.smhrd.db.UserMapper.user_preference", preference);
		sqlSession.close();
		return cnt;
	}
	
}
