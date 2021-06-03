package hustar.booking.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookingController {
	
	@RequestMapping(value = "/booking/list.do")
	public String list() throws Exception {
		return "/booking/list";
	}
	
	@RequestMapping(value = "/booking/view.do")
	public String view() throws Exception {
		return "/booking/view";
	}
}
