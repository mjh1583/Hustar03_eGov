package egovframework.com.cmm.interceptor;

import hustar.member.service.MemberVO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.FlashMapManager;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.mvc.WebContentInterceptor;
import org.springframework.web.servlet.support.RequestContextUtils;

/**
 * 인증여부 체크 인터셉터
 * @author 공통서비스 개발팀 서준식
 * @since 2011.07.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2011.07.01  서준식          최초 생성
 *  2011.09.07  서준식          인증이 필요없는 URL을 패스하는 로직 추가
 *  2014.06.11  이기하          인증이 필요없는 URL을 패스하는 로직 삭제(xml로 대체)
 *  </pre>
 */

public class MyAuthenticInterceptor extends WebContentInterceptor {

	/**
	 * 세션에 계정정보(LoginVO)가 있는지 여부로 인증 여부를 체크한다.
	 * 계정정보(LoginVO)가 없다면, 로그인 페이지로 이동한다.
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException {

		MemberVO loginVO = (MemberVO)RequestContextHolder.getRequestAttributes().getAttribute("login", RequestAttributes.SCOPE_SESSION)==null ? 
				new MemberVO() : (MemberVO) RequestContextHolder.getRequestAttributes().getAttribute("login", RequestAttributes.SCOPE_SESSION);
		
		if (loginVO.getId() != null) {
			return true;
		} else {
			// 로그인이 필요하다는 메세지를 전달
			FlashMap flashMap = new FlashMap();
			flashMap.put("msg", "로그인이 필요합니다.");
			FlashMapManager flashMapManager = RequestContextUtils.getFlashMapManager(request);
			flashMapManager.saveOutputFlashMap(flashMap, request, response);
			
			ModelAndView modelAndView = new ModelAndView("redirect:/member/login.do");
			throw new ModelAndViewDefiningException(modelAndView);
		}
	}

}
