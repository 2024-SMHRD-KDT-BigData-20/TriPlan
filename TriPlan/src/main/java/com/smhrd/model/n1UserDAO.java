package com.smhrd.model;

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
		
		
		return loginVO;
	}
	
}
