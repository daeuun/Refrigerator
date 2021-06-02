package com.refrigerator.banner.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.recipe.model.service.RecipeService;

/**
 * Servlet implementation class AdminBannerRecipeController
 */
/*관리자페이지 - 배너 레시피 관리 페이지로 이동*/
@WebServlet("/adRecipe.ba")
public class AdminBannerRecipeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBannerRecipeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    /*
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int recipeNo = Integer.parseInt(request.getParameter("rno"));
		String status = request.getParameter("status");
		
		Recipe rc = new RecipeService().selectRecipe();
		
		if(rc>0) { // 조회결과 있음 
			
			request.getRequestDispatcher("views/banner/adminBannerRecipe.jsp").forward(request, response);
		
		}else { // 조회결과 없음
			request.setAttribute("errorMsg", "조회결과가 없습니다. 다시 한번 입력사항을 확인해주세요.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}*/

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
