package hustar.member.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
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
	public String login(HttpServletRequest request,
			Model model) throws Exception {
		
		Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request); //메세지를 받아옴
		
		if(inputFlashMap != null) { // 메세지가 있으면 해당 뷰에 뿌려줌
			model.addAttribute("msg", inputFlashMap.get("msg"));
			System.out.println("msg = " + inputFlashMap.get("msg"));
		}
		return "/member/login";
	}
	
	@RequestMapping(value = "/member/actionLogout.do")
	public String actionLogout() throws Exception {
		// 로그아웃
		RequestAttributes request = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		request.setAttribute("login", null, RequestAttributes.SCOPE_SESSION);
		//return "redirect:/index.do";
		return "redirect:/member/login.do";
	}
	
	// 회원가입 화면
	@RequestMapping(value = "/member/join.do")
	public String join(HttpServletRequest request, 
			Model model) throws Exception {
		
		/*
		 * String pass = "1234"; // 평문(비밀번호 원본) 암호화 String encPass = BCrypt.hashpw(pass,
		 * BCrypt.gensalt()); System.out.println("encPass = " + encPass); boolean
		 * success = BCrypt.checkpw(pass, encPass); System.out.println("success = " +
		 * success);
		 */
		
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

		// ID 중복체크
		int cnt = commonService.selectListTotCnt(memberVO, null, null, "memberDAO.selectMemberCnt");

		if(cnt > 0) {
			redirectAttributes.addFlashAttribute("msg", "사용 중인 아이디입니다.");
		}
		else {
			// 입력한 비밀번호를 암호화(해시함수)하고 저장
			String encPass = BCrypt.hashpw(memberVO.getPassword(), BCrypt.gensalt());
			memberVO.setPassword(encPass);
			
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
	
	// 로그인 버튼을 눌렀을때
	@RequestMapping(value = "/member/actionLogin.do")
	public String actionLogin(@ModelAttribute("memberVO") MemberVO memberVO,
			RedirectAttributes redirectAttributes) throws Exception {
		
		MemberVO loginVO = (MemberVO) commonService.selectView(memberVO, null, null, "memberDAO.selectMemberView");
		
		if(loginVO != null) {
			if(BCrypt.checkpw(memberVO.getPassword(), loginVO.getPassword())) {
				// 로그인 정보 메뉴에 전달
				HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
				request.getSession().setAttribute("login", loginVO);
				
				return "redirect:/index.do";
			}
			else { // 비밀번호 불일치
				redirectAttributes.addFlashAttribute("msg", "비밀번호가 틀렸습니다.");
			}
		} 
		else {
			// ID가 존재하지 않음
			redirectAttributes.addFlashAttribute("msg", "존재하지 않는 아이디입니다.");
		}
		
		return "redirect:/member/login.do";
	}
	
	// 비동기 방식의 로그인
	@RequestMapping(value = "/member/actionLoginAsync.do")
	public ModelAndView actionLoginAsync(ModelMap model, String id, String password, RedirectAttributes redirectAttributes) throws Exception {
		MemberVO memberVO = new MemberVO();
		memberVO.setId(id);
		memberVO.setPassword(password);
		MemberVO loginVO = (MemberVO) commonService.selectView(memberVO, null, null, "memberDAO.selectMemberView");
				
		if(loginVO != null) {
			if(BCrypt.checkpw(memberVO.getPassword(), loginVO.getPassword())) {
				// 로그인 정보 메뉴에 전달
				HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
				request.getSession().setAttribute("login", loginVO);
				
				model.addAttribute("login", "true");
			}
			else { // 비밀번호 불일치
				model.addAttribute("login", "false");
			}
		} 
		else {
			// ID가 존재하지 않음
			model.addAttribute("login", "false");
		}
		
		return new ModelAndView(jsonView);
	}
}
