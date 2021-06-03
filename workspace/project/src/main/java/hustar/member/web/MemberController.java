package hustar.member.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import egovframework.com.cmm.service.CommonService;
import hustar.member.service.MemberVO;

// 모든 컨트롤러는 throws Exception 해야 한다.
@Controller
public class MemberController {
	
	@Resource(name = "commonService")
	CommonService commonService;
	
	// egov-com-servlet.xml 에 있는 id값으로 매핑
	@Resource(name = "jsonView")
	MappingJackson2JsonView jsonView; 
	
	@RequestMapping(value = "/member/mypage.do")
	public String mypage() throws Exception {
		return "/member/mypage";
	}
	
	@RequestMapping(value = "/member/login.do")
	public String login() throws Exception {
		return "/member/login";
	}
	
	// 회원가입 화면
	@RequestMapping(value = "/member/join.do")
	public String join(HttpServletRequest request, 
			Model model) throws Exception {
		
		Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request); //메세지를 받아옴
		
		if(inputFlashMap != null) { // 메세지가 있으면 해당 뷰에 뿌려줌
			model.addAttribute("msg", inputFlashMap.get("msg"));
			System.out.println("msg = " + inputFlashMap.get("msg"));
		}
		
		return "/member/join";
	}
	
	// 회원가입 
	@RequestMapping(value = "/member/joinInsert.do")
	public String joinInsert(
			@ModelAttribute("memberVO") MemberVO memberVO,
			RedirectAttributes redirectAttributes // 메세지 전달
			) throws Exception {
		
		System.out.println("id = " + memberVO.getId());
		System.out.println("password = " + memberVO.getPassword());
		System.out.println("name = " + memberVO.getName());
		System.out.println("phone = " + memberVO.getPhone());
		System.out.println("birth = " + memberVO.getBirth());
		System.out.println("gender = " + memberVO.getGender());
		System.out.println("job = " + memberVO.getJob());
		System.out.println("address = " + memberVO.getAddress());
		
		// ID 중복체크
		int cnt = commonService.selectListTotCnt(memberVO, null, null, "memberDAO.selectMemberCnt");

		if(cnt > 0) {
			redirectAttributes.addFlashAttribute("msg", "사용 중인 아이디입니다.");
		}
		else {
			// 회원가입 정보 DB에 추가
			commonService.insert(memberVO, null, null, "memberDAO.insertMember");
			  
			redirectAttributes.addFlashAttribute("msg", "회원가입에 성공하였습니다.");
		}
		  
		/*
		 * forward vs redirect
		 * forward : 서버 내에서 바로 join.do를 요청함
		 * redirect : 웹 브라우저에서 다시 join.do를 요청함
		 */
		return "redirect:/member/join.do";
	}
	
	// 아이디 체크
	@RequestMapping(value = "/member/checkId.do")
	public ModelAndView checkId(ModelMap model, @ModelAttribute("memberVO") MemberVO memberVO) throws Exception {
		
		// ID 중복체크
		int cnt = commonService.selectListTotCnt(memberVO, null, null, "memberDAO.selectMemberCnt");

		if(cnt > 0) {
			model.addAttribute("duplicate", "true");
		}
		else {
			model.addAttribute("duplicate", "false");
		}
		
		return new ModelAndView(jsonView);
	}
}
