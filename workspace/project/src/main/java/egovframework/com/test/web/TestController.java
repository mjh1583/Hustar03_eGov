package egovframework.com.test.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.test.service.TestService;
import egovframework.com.test.service.TestVO;

@Controller
@RequestMapping(value = {"/test", "/admin"})
public class TestController {
	protected Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name = "testService")
	TestService testService;

//	@RequestMapping(value = {"/index.do"})
//	public String index() {
//		return "index";
//	}

	@RequestMapping(value = {"/selectTestList.do", "/selectTest2List.do"})
	public String selectTestList(
		@ModelAttribute("searchVO") TestVO searchVO,
		HttpServletRequest req,
		HttpServletResponse res,
		ModelMap model
		) throws Exception {
		
		List<TestVO> resultList = (List<TestVO>)testService.selectList(searchVO, req, res);
		
		if(resultList != null) {
			for(int i = 0; i < resultList.size(); i++) {
				TestVO vo = resultList.get(i);
				log.debug("te_id = " + vo.getTe_id());
				log.debug("te_name = " + vo.getTe_name());
				log.debug("te_content = " + vo.getTe_content());
				log.debug("insert_date = " + vo.getInsert_date());
				log.debug("modify_date = " + vo.getModify_date());
			}
		}
		model.addAttribute("resultList", resultList);
		
		return "test/test";
	}
}