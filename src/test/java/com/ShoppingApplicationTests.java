package com;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class ShoppingApplicationTests {

	@Test
	void contextLoads() {
	}

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Test
	  public void testSqlSession() throws Exception{
	    System.out.println(sqlSession.toString());
	  }
}
