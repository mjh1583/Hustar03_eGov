package hustar.page.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
	@RequestMapping(value = "/page/intro.do")
	public String intro() throws Exception {
		return "/page/intro";
	}
}
