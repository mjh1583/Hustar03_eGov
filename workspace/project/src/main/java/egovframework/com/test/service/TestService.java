package egovframework.com.test.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface TestService {
	public List<?> selectList(TestVO testVO, HttpServletRequest req, HttpServletResponse res) throws Exception;
}
