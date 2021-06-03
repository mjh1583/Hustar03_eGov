package hustar.bbs.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BbsController {
	
	// 공지사항
	// 공지사항 목록
	@RequestMapping("/bbs/notice_list.do")
	public String notice_list() throws Exception {
		return "/bbs/notice_list";
	}
	
	@RequestMapping("/bbs/notice_write.do")
	public String notice_write() throws Exception {
		return "/bbs/notice_write";
	}
	
	@RequestMapping("/bbs/notice_view.do")
	public String notice_view() throws Exception {
		return "/bbs/notice_view";
	}
	
	// 갤러리
	// 갤러리 목록
	@RequestMapping("/bbs/gallery_list.do")
	public String gallery_list() throws Exception {
		return "/bbs/gallery_list";
	}
	
	@RequestMapping("/bbs/gallery_write.do")
	public String gallery_write() throws Exception {
		return "/bbs/gallery_write";
	}
	
	@RequestMapping("/bbs/gallery_view.do")
	public String gallery_view() throws Exception {
		return "/bbs/gallery_view";
	}
	
	// 자유게시판
	// 자유게시판 목록
	@RequestMapping("/bbs/free_list.do")
	public String free_list() throws Exception {
		return "/bbs/free_list";
	}
	
	@RequestMapping("/bbs/free_write.do")
	public String free_write() throws Exception {
		return "/bbs/free_write";
	}
	
	@RequestMapping("/bbs/free_view.do")
	public String free_view() throws Exception {
		return "/bbs/free_view";
	}
}
