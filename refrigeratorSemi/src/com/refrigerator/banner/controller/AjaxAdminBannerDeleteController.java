package com.refrigerator.banner.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.refrigerator.banner.model.service.BannerService;
import com.refrigerator.banner.model.vo.Banner;
import com.refrigerator.common.MyFileRenamePolicy;

/**
 * Servlet implementation class AdminBannerDeleteController
 */
@WebServlet("/adDelete.ba")
public class AjaxAdminBannerDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAdminBannerDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//혹시모르니 세팅해주자!
		int bannerNo = Integer.parseInt(request.getParameter("bannerNo"));

		//선택한 배너의 정보를 뽑아오는 메소드 !! 
		Banner bannerInfo = new BannerService().selectBanner(bannerNo);
		// 먼저 정보를 가져와서 담은 상태이다! 그래서 밑에서 삭제가 되든 뭐하든 이미 정보가 한번 박혀있는것이라 쓸수가 있다! db와 별개로 
		
		//화면단에서 보여줄 문구를 위한 변수 
		String bannerName = bannerInfo.getBannerName();
		// 배너 사진을 프로젝트에서 삭제하기위한 세팅
		// 물리적인 경로를 알아오기 위한 ! 메소드 사용 
		String savePath = request.getSession().getServletContext().getRealPath("/resources/banner_upfiles/");
		String forAbsolutePath = bannerInfo.getBannerImg().replace("resources/banner_upfiles/","" );
		// replace메소드로는 /를 \로 바꿀수가 없다 애러 뜬다! 
		int result = new BannerService().deleteBanner(bannerNo); 

		if(result>0) {
			//기존의 사진파일 날려버려야한다. // java.io.file로다가 import해줘야한다!
			// 커스터마이징 한것이다 어짜피 해당 수정이미지 파일명만이 힐요한것이기에 ! 문제 없다! 
			new File(savePath + forAbsolutePath).delete();
			
			// ajax로 요청했을 경우 !! 절대 포워딩이나 샌드리다이렉트로 재요청 하지 않는다!!! 
			// 오로지 응답 데이터만 넘겨주면된다!!!
			// 응답데이터에 대한 mimetype(text/html) 과 charset지정을 해줘야한다!!! 
			response.setContentType("text/html; charset=UTF-8");
			// 이같이 세팅을 해줘야만 한다. 그래야지 한글이 안깨진다. 
			bannerName += " 배너 삭제에 성공하였습니다.";
			response.getWriter().print(bannerName);
		}else {
			response.setContentType("text/html; charset=UTF-8");
			// 이같이 세팅을 해줘야만 한다. 그래야지 한글이 안깨진다.
			bannerName += " 배너 삭제에 실패햐였습니다.";
			response.getWriter().print(bannerName);			
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
