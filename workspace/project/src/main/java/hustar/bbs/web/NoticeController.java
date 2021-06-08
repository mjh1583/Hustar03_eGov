package hustar.bbs.web;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import egovframework.com.cmm.service.CommonService;
import egovframework.com.cmm.util.EgovProperties;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import hustar.bbs.service.NoticeVO;
import hustar.member.service.MemberVO;
import hustar.util.FileUtil;

@Controller
public class NoticeController {
	
	@Resource(name = "commonService")
	CommonService commonService;
	
	// egov-com-servlet.xml 에 있는 id값으로 매핑
	@Resource(name = "jsonView")
	MappingJackson2JsonView jsonView; 
	
	// 파일 업로드 경로 지정
	private static final String NOTICE_UPLOAD_PATH = EgovProperties.getProperty("Globals.FileStorePath") +  File.separator + "notice";
	
	// 공지사항 게시판 목록 (검색, 페이징)
	@RequestMapping(value = "/bbs/notice_list.do")
	public String notice_list(
			Model model,
			NoticeVO searchVO) throws Exception {
		
		// 페이징 처리
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());  // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(searchVO.getRecordCountPerPage());  // 한 페이지 당 몇 개를 표시할 것인가
		paginationInfo.setPageSize(searchVO.getPageSize());  // 페이지 이동 가능한 수
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setPageSize(paginationInfo.getPageSize());
		
		// 전체 공지사항의 갯수
		int recordCount = commonService.selectListTotCnt(searchVO, null, null, "noticeDAO.selectNoticeListCnt");
		paginationInfo.setTotalRecordCount(recordCount);
		
		// 전체 공지사항 리스트
		List<NoticeVO> noticeVOList = (List<NoticeVO>) commonService.selectList(searchVO, null, null, "noticeDAO.selectNoticeList");
		
		model.addAttribute("noticeVOList", noticeVOList);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("searchVO", searchVO);  // 검색어 넘겨줌
		
		return "/bbs/notice_list";
	}
	
	// 공지사항 글쓰기
	@RequestMapping("/bbs/notice_write.do")
	public String notice_write(Model model) throws Exception {
		
		model.addAttribute("mode", "write");
		
		return "/bbs/notice_write";
	}
	
	// 공지사항 글쓰기 액션
	@RequestMapping("/bbs/notice_write_action.do")
	public String notice_write_action(
			NoticeVO noticeVO, 
			HttpSession session, 
			String mode,
			RedirectAttributes redirectAttributes,
			MultipartFile uploadFile) throws Exception {
		
		MemberVO loginVO = (MemberVO)session.getAttribute("login");
		
		// 로그인이 되어 있지 않다면 로그인 페이지로 이동
		if(loginVO == null) {
			redirectAttributes.addFlashAttribute("msg", "로그인이 필요합니다.");
			return "redirect:/member/login.do";
		}
		
		// 작성자 = 로그인 한 사람의 이름
		noticeVO.setWriter(loginVO.getName());
		
		// 저장할 파일을 찾아서 경로에 저장
		String filename = FileUtil.saveFile(uploadFile, NOTICE_UPLOAD_PATH);
		
		// uuid(랜덤한 값)_dog.jpg
		if(filename != null) {
			noticeVO.setFilename(filename);  // uuid가 붙은 파일이름
			
			// 스플릿해서 uuid와 _를 제외한 오리지널 파일명을 가져옴
			String oriFilename = filename.split("_")[1]; // 원래 파일이름
			noticeVO.setOriFilename(oriFilename);
		}
		
		// mode: write, modify
		if(mode.equals("write")) {
			commonService.insert(noticeVO, null, null, "noticeDAO.insertNotice");
		} 
		else {
			commonService.update(noticeVO, null, null, "noticeDAO.updateNotice");
		}
		
		return "redirect:/bbs/notice_list.do";
	}
	
	// 파일 다운로드
	@RequestMapping("/bbs/notice_downloadFile.do")
	public void notice_downloadFile(NoticeVO searchVO,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		NoticeVO noticeVO = (NoticeVO) commonService.selectView(searchVO, null, null, "noticeDAO.selectNoticeView");
		
		String filename = noticeVO.getFilename();
		
		if(filename == null) {
			return;
		}
		
		// 파일 다운로드를 위한 이름과 경로
		String filePath = NOTICE_UPLOAD_PATH + "/" + filename;
		
		// 파일 다운로드
		FileUtil.downFile(request, response, filePath, noticeVO.getOriFilename());
		
	}
	
	@RequestMapping("/bbs/notice_deleteFile.do")
	public ModelAndView notice_deleteFile(NoticeVO searchVO,
			Model model) throws Exception {
		
		NoticeVO fileVO = (NoticeVO) commonService.selectView(searchVO, null, null, "noticeDAO.selectNoticeView");
		
		String filePath = NOTICE_UPLOAD_PATH + "/" + fileVO.getOriFilename();
		
		if(FileUtil.deleteFile(filePath) == true) {
			NoticeVO noticeVO = new NoticeVO();
			noticeVO.setSeq(searchVO.getSeq());
			noticeVO.setFilename("");
			noticeVO.setOriFilename("");
			commonService.update(noticeVO, null, null, "noticeDAO.updateNotice");
			
			model.addAttribute("success", "true");
			
		} else {
			model.addAttribute("duplicate", "false");
		}
		
		return new ModelAndView(jsonView);
	}
	
	// 공지사항 수정
	@RequestMapping("/bbs/notice_modify.do")
	public String notice_modify(
			NoticeVO searchVO, Model model) throws Exception {
		
		NoticeVO noticeVO = (NoticeVO)commonService.selectView(searchVO, null, null, "noticeDAO.selectNoticeView");
		
		model.addAttribute("noticeVO", noticeVO);
		
		model.addAttribute("mode", "modify");
		
		return "/bbs/notice_write";
	}
	
	// 공지사항 삭제
	@RequestMapping("/bbs/notice_delete.do")
	public String notice_delete(NoticeVO noticeVO, @RequestParam("seq") int seq) throws Exception {
		
		noticeVO.setSeq(seq);
		commonService.delete(noticeVO, null, null, "noticeDAO.deleteNotice");
		
		return "redirect:/bbs/notice_list.do";
	}
		
	// 공지사항 상세 뷰
	@RequestMapping("/bbs/notice_view.do")
	public String notice_view(
			NoticeVO searchVO,
			Model model
			) throws Exception {
		
		NoticeVO noticeVO = (NoticeVO) commonService.selectView(searchVO, null, null, "noticeDAO.selectNoticeView");
		
		model.addAttribute("notice", noticeVO);
		
		return "/bbs/notice_view";
	}
	
}
