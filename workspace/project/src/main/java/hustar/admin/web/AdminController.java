package hustar.admin.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping(value = "/admin/set.do")
	public String set() throws Exception {
		return "/admin/set";
	}
}
