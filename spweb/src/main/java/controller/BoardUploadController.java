package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class BoardUploadController {

	public BoardUploadController() {

	}
	
	@ResponseBody
	@RequestMapping(value = "/summernoteUpload.do", produces = "application/text;charset=utf8")
	public String freeBoardUpload(MultipartFile file,HttpServletRequest request, HttpServletResponse response, int boardCategory) {
		System.out.println("게시판 업로드 프로세스 접근.");
		String fileName = "";
		String resultFileName = "";
		if (!file.isEmpty()) {
			fileName = file.getOriginalFilename();

			// 중복 파일명을 처리하기 위해 난수 발생
			UUID random = UUID.randomUUID();
			String root = request.getSession().getServletContext().getRealPath("/");
			
			String mainSaveDirectory = root+"upload";
			
			File mainFolder = new File(mainSaveDirectory);
			
			if(!mainFolder.exists())
				mainFolder.mkdir();
			
			String saveDirectory ="";
			String subSaveDirectory = "";
			
			//어떤 게시판 인지 - 게시판이 더 추가될 경우 switch로 변경 예정
			if(boardCategory == 0) {
				subSaveDirectory = "freeBoard";
			}else if(boardCategory == 1) {
				subSaveDirectory = "noticeBoard";
			}else if(boardCategory == 2) {
				subSaveDirectory = "eventBoard";
			}else if(boardCategory == 3) {
				subSaveDirectory = "updateBoard";
			}
			
			//저장 경로 = root/upload/게시판종류
			saveDirectory = mainSaveDirectory+ File.separator + subSaveDirectory + File.separator;
			File fe = new File(saveDirectory);
			if (!fe.exists())
				fe.mkdir();
			
			//저장 경로 = root/upload/게시판종류/UUID_파일이름
			File ff = new File(saveDirectory, random + "_" + fileName);
			
			try {
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			resultFileName = "upload"+"/"+subSaveDirectory+"/"+random+"_"+fileName;
		}
		System.out.println("resultFileName : "+resultFileName);
		return resultFileName;
	}
}
