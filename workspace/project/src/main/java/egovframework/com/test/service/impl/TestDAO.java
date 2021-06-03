package egovframework.com.test.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.MainDAO;
import egovframework.com.test.service.TestVO;

@Repository("testDAO")
public class TestDAO extends MainDAO{
	public List<?> selectList(TestVO testVO, String sql_id) {
		return selectList(sql_id, testVO);
	}
}
