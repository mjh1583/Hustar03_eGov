package hustar.main.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	// https://namubada.net/216 : 404 오류에 대한 블로그
	@RequestMapping(value = {"/index.do"})
	public String index() throws Exception {
		return "main/index";
	}
}
