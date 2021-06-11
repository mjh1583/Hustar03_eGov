package hustar.booking.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import egovframework.com.cmm.service.CommonService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import hustar.booking.service.BookingVO;
import hustar.member.service.MemberVO;

@Controller
public class BookingController {
	
	@Resource(name="commonService")
	CommonService commonService;
	
	@Resource(name ="jsonView")
	MappingJackson2JsonView jsonView;
	
	@RequestMapping("/booking/list.do")
	public String list() throws Exception {
		return "/booking/list";
	}
	
	// 예약 리스트
	@RequestMapping("/booking/mypage.do")
	public String mypage(BookingVO searchVO,
			Model model,
			HttpSession session,
			RedirectAttributes redirectAttributes) throws Exception {
		
		// 페이징 처리
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());  // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(searchVO.getRecordCountPerPage());  // 한 페이지 당 몇 개를 표시할 것인가
		paginationInfo.setPageSize(searchVO.getPageSize());  // 페이지 이동 가능한 수
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setPageSize(paginationInfo.getPageSize());
		
		// 전체 공지사항의 갯수
		int recordCount = commonService.selectListTotCnt(searchVO, null, null, "bookingDAO.selectBookingListCnt");
		paginationInfo.setTotalRecordCount(recordCount);
		
		// 로그인 한 아이디를 가져옴
		MemberVO loginVO = (MemberVO) session.getAttribute("login");
		
		/*
		 * if(loginVO == null) { redirectAttributes.addFlashAttribute("msg",
		 * "로그인이 필요합니다."); return "redirect:/member/login.do"; }
		 */
		
		searchVO.setId(loginVO.getId());
		searchVO.setAuth(loginVO.getAuth());
		
		//List<BookingVO> bookingVOList = (List<BookingVO>) commonService.selectList(searchVO, null, null, "bookingDAO.selectBookingList");
		List<EgovMap> bookingVOList = (List<EgovMap>) commonService.selectList(searchVO, null, null, "bookingDAO.selectBookingList");
		
		model.addAttribute("bookingVOList", bookingVOList);
		model.addAttribute("paginationInfo", paginationInfo);  // 페이징
		model.addAttribute("searchVO", searchVO);  // 검색어 넘겨줌
		
		return "/booking/mypage";
	}
	
	// 예약하기 뷰
	@RequestMapping("/booking/view.do")
	public String view(
			String location,
			Model model) throws Exception {
		
		model.addAttribute("location", location);
		
		return "/booking/view";
	}
	
	// 예약하기
	@RequestMapping("/booking/booking.do")
	public String booking(
			BookingVO bookingVO,
			HttpSession session,
			RedirectAttributes redirectAttributes) throws Exception {
		
		MemberVO loginVO = (MemberVO) session.getAttribute("login");
		
		if (loginVO == null) {
			redirectAttributes.addFlashAttribute("msg", "로그인이 필요합니다.");
			return "redirect:/member/login.do";
		}
		
		bookingVO.setId(loginVO.getId());
		bookingVO.setName(loginVO.getName());
		
		commonService.insert(bookingVO, null, null, "bookingDAO.insertBooking");
		
		return "redirect:/booking/list.do";
	}
	
	// 예약 상태 수정
	@RequestMapping("/booking/modify_status.do")
	public ModelAndView modify_status(BookingVO bookingVO,
			Model model) throws Exception {
		
		commonService.update(bookingVO, null, null, "bookingDAO.updateBooking");
		
		// ajax에 성공했다는 것을 알려줌
		model.addAttribute("success", "true");
		
		return new ModelAndView(jsonView);
	}
}
