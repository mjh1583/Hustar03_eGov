package hustar.bbs.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.service.CommonService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import hustar.bbs.service.NoticeVO;

@Controller
public class NoticeController {
	
	@Resource(name = "commonService")
	CommonService commonService;
	
	// 공지사항 게시판 목록 (검색, 페이징)
	@RequestMapping(value = "/bbs/notice_list.do")
	public String notice_list(
			Model model,
			NoticeVO searchVO) throws Exception {
		
		System.out.println("searchKeyword = " + searchVO.getSearchKeyword());
		
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
		System.out.println("recordCount = " + recordCount);
		
		// 전체 공지사항 리스트
		List<NoticeVO> noticeVOList = (List<NoticeVO>) commonService.selectList(searchVO, null, null, "noticeDAO.selectNoticeList");
		
		model.addAttribute("noticeVOList", noticeVOList);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("searchVO", searchVO);  // 검색어 넘겨줌
		
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
	
}
