package com.refrigerator.banner.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.refrigerator.banner.model.service.BannerService;
import com.refrigerator.banner.model.vo.Banner;
import com.refrigerator.common.MyFileRenamePolicy;

/**
 * Servlet implementation class AdminBannerUpdateController
 */
@WebServlet("/adUpdate.ba")
public class AdminBannerUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBannerUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//이미지는 banner_upfiles 라는 폴더에 보관을 할것이다. post로 넘어왔으니 일단 인코딩 세팅부터
		request.setCharacterEncoding("UTF-8");

		if(ServletFileUpload.isMultipartContent(request)) {			
			int maxSize = 10 * 1024 * 1024; //(byte기준이다.)
			String savePath = request.getSession().getServletContext().getRealPath("/resources/banner_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 삭제할 파일 비교용 
			String deleteFile = multiRequest.getParameter("deleteFile");
			String newFile = multiRequest.getFilesystemName("bannerImg");
			
			//아래는 db에 담을 변수들이다. 
			String bannerImg ;
			if(newFile == null) { 
				// 즉 첨부파일이 안들어왔을경우 
				bannerImg = "resources/banner_upfiles/" + deleteFile; // 기존의 값으로 그대로 update된다!
				newFile = deleteFile;
			}else {
				// 새로운 첨부파일이 들어온 상태! 
				bannerImg = "resources/banner_upfiles/" + multiRequest.getFilesystemName("bannerImg");
			}
			
			//DB에 전달할 값 뽑기 
			int bannerNo = Integer.parseInt(multiRequest.getParameter("bannerNo"));
			String bannerName = multiRequest.getParameter("bannerName");
			String companyName = multiRequest.getParameter("companyName");
			String bannerCategory = multiRequest.getParameter("bannerCategory");
			String bannerStatus = multiRequest.getParameter("bannerStatus");			
			String startDate = multiRequest.getParameter("startDate");
			startDate = startDate.replace("-", "/");
			String endDate = multiRequest.getParameter("endDate");
			endDate = endDate.replace("-", "/");
			String page = multiRequest.getParameter("page");
						
			Banner ba = new Banner(bannerNo, bannerName, companyName, bannerCategory, bannerStatus, startDate, endDate, bannerImg, page);
			
			int result = new BannerService().updateBanner(ba);


			//요청 처리후 성공했을시 실패했을시 
			if(result > 0 ) { // 성공했을 경우
				
				if(!deleteFile.equals(newFile)) {
					//update가 성공하고! 기존의 파일과 새로 첨부한 파일이 다를경우! 
					//기존의 사진파일 날려버려야한다. // java.io.file로다가 import해줘야한다!
					// 커스터마이징 한것이다 어짜피 해당 수정이미지 파일명만이 힐요한것이기에 ! 문제 없다! 
					new File(savePath + deleteFile).delete();
				}
				
				request.getSession().setAttribute("alertMsg", "성공적으로 배너가 수정되었습니다.");
				//이제 url 재요청
				response.sendRedirect(request.getContextPath() + "/adlist.ba?currentPage=1");
				
			}else { // 실패했을경우 error페이지가 보여지도록 에러문구 (error페이지로 forwarding 하는것)
				request.setAttribute("errorTitleMsg", "배너 수정 실패");
				request.setAttribute("errorMsg", "error 발생");
				request.getRequestDispatcher("views/common/user/errorPage.jsp").forward(request, response);
			}

		}	

	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
