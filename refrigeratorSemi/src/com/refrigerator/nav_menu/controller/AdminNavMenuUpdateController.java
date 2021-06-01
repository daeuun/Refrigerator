package com.refrigerator.nav_menu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.nav_menu.model.service.NavMenuService;

/**
 * Servlet implementation class AdminNavMenuUpdateController
 */
@WebServlet("/modifyNav.nav")
public class AdminNavMenuUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNavMenuUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int homeNo = Integer.parseInt(request.getParameter("home"));
		int categoryNo = Integer.parseInt(request.getParameter("category"));
		int eventNo = Integer.parseInt(request.getParameter("event"));
		int recipeNo = Integer.parseInt(request.getParameter("recipe"));
		int csNo = Integer.parseInt(request.getParameter("cs"));
		
		int[] navOrder = {homeNo, categoryNo, eventNo, recipeNo, csNo};
		
		int result = new NavMenuService().updateNavMenu(navOrder);
		
		//요청 처리후 성공했을시 실패했을시 
		if(result > 0 ) { // 성공했을 경우
			request.getSession().setAttribute("confirmMsg", "성공적으로 메뉴 순서가 수정 되었습니다. 확인하러 메인페이지로 이동하시겠습니까?");
			//이제 url 재요청
			response.sendRedirect(request.getContextPath() + "/menuList.nav");
			
		}else { // 실패했을경우 error페이지가 보여지도록 에러문구 (error페이지로 forwarding 하는것)
			request.setAttribute("errorTitleMsg", "중복된 순서넣으면 안됩니다!!! ");
			request.setAttribute("errorMsg", "제대로!!! 순서 입력해서 수정해주세용! <br> 진심 심각한 오류라서 중복된 숫자 계속부여하면 서버 터져요...");
			request.getRequestDispatcher("views/common/user/errorPage.jsp").forward(request, response);
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
