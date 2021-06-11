package hustar.bbs.web;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import egovframework.com.cmm.service.CommonService;
import egovframework.com.cmm.util.EgovProperties;
import hustar.bbs.service.GalleryVO;
import hustar.member.service.MemberVO;
import hustar.util.FileUtil;

@Controller
public class GalleryController {
	
	private static final String GALLERY_UPLOAD_PATH = EgovProperties.getProperty("Globals.FileStorePath") + File.separator + "gallery";
	
	@Resource(name = "commonService")
	CommonService commonService;
	
	@Resource(name = "jsonView")
	MappingJackson2JsonView jsonView;
	
	// 갤러리 목록
	@RequestMapping("/bbs/gallery_list.do")
	public String  gallery_list(
			GalleryVO searchVO, 
			Model model) throws Exception {
		
		List<GalleryVO> galleryVOList = (List<GalleryVO>) commonService.selectList(searchVO, null, null, "galleryDAO.selectGalleryList");
		
		model.addAttribute("galleryVOList", galleryVOList);
		
		return "/bbs/gallery_list";
	}
	
	// 갤러리 상세 보기
	@RequestMapping("/bbs/gallery_view.do")
	public String gallery_view(GalleryVO searchVO, Model model) throws Exception {
		
		GalleryVO galleryVO = (GalleryVO) commonService.selectView(searchVO, null, null, "galleryDAO.selectGalleryView");
		
		model.addAttribute("galleryVO", galleryVO);
		
		return "/bbs/gallery_view";
	}
	
	// 갤러리 글쓰기
	@RequestMapping("/bbs/gallery_write.do")
	public String gallery_write(Model model) throws Exception {
		
		model.addAttribute("mode", "write");
		
		return "/bbs/gallery_write";
	}
	
	// 갤러리 글쓰기 액션
	@RequestMapping("/bbs/gallery_write_action.do")
	public String gallery_write_action(
			GalleryVO galleryVO,
			String mode,
			HttpSession session,
			RedirectAttributes redirectAttributes,
			MultipartFile uploadFile) throws Exception {
		
		// 로그인 정보 받아옴
		MemberVO loginVO = (MemberVO) session.getAttribute("login");
		
		// 로그인을 안했으면
		/*
		 * if(loginVO == null) { redirectAttributes.addFlashAttribute("msg",
		 * "로그인이 필요합니다.");
		 * 
		 * return "redirect:/member/login.do"; } galleryVO.setWriter(loginVO.getName());
		 */
		
		// 파일 저장
		String filename = FileUtil.saveFile(uploadFile, GALLERY_UPLOAD_PATH);
		
		if(filename != null) {
			galleryVO.setFilename(filename);
			
			String oriFilename = filename.split("_")[1];
			galleryVO.setOriFilename(oriFilename);
		}
		
		// mode: write, modify
		if(mode.equals("write")) {
			commonService.insert(galleryVO, null, null, "galleryDAO.insertGallery");
		} 
		else {
			commonService.update(galleryVO, null, null, "galleryDAO.updateGallery");
		}
		
		return "redirect:/bbs/gallery_list.do";
	}

	// 갤러리 수정
	@RequestMapping("/bbs/gallery_modify.do")
	public String gallery_modify(Model model,
			GalleryVO searchVO) throws Exception {
		
		GalleryVO galleryVO = (GalleryVO) commonService.selectView(searchVO, null, null, "galleryDAO.selectGalleryView");
		
		model.addAttribute("galleryVO", galleryVO);
		model.addAttribute("mode", "modify");
		
		return "/bbs/gallery_write";
	}
	
	// 갤러리 삭제
	@RequestMapping("/bbs/gallery_delete.do")
	public String gallery_delete(GalleryVO searchVO) throws Exception {
		
		GalleryVO fileVO = (GalleryVO) commonService.selectView(searchVO, null, null, "galleryDAO.selectGalleryView");
		String filePath = GALLERY_UPLOAD_PATH + "/" + fileVO.getFilename();
		FileUtil.deleteFile(filePath);
		
		commonService.delete(searchVO, null, null, "galleryDAO.deleteGallery");
		
		return "redirect:/bbs/gallery_list.do";
	}
	
	// 파일 삭제
	@RequestMapping("/bbs/gallery_deleteFile.do")
	public ModelAndView gallery_deleteFile(GalleryVO searchVO,
			Model model) throws Exception {
		
		GalleryVO fileVO = (GalleryVO) commonService.selectView(searchVO, null, null, "galleryDAO.selectGalleryView");
		
		String filePath = GALLERY_UPLOAD_PATH + "/" + fileVO.getOriFilename();
		
		if(FileUtil.deleteFile(filePath) == true) {
			GalleryVO galleryVO = new GalleryVO();
			galleryVO.setSeq(searchVO.getSeq());
			galleryVO.setFilename("");
			galleryVO.setOriFilename("");
			commonService.update(galleryVO, null, null, "galleryDAO.updateGallery");
			
			model.addAttribute("success", "true");
			
		} else {
			model.addAttribute("duplicate", "false");
		}
		
		return new ModelAndView(jsonView);
	}
	
	// 갤러리 뷰 화면에 이미지 출력
	@RequestMapping("/bbs/gallery_image.do")
	public void gallery_image(GalleryVO searchVO,
			HttpServletResponse response) throws Exception {
		
		GalleryVO galleryVO = (GalleryVO) commonService.selectView(searchVO, null, null, "galleryDAO.selectGalleryView");
		
		// 갤러리 뷰 화면에 이미지 출력
		FileUtil.displayImage(response, GALLERY_UPLOAD_PATH, galleryVO.getFilename());
	}
}
