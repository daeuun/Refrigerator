package com.refrigerator.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.recipe.model.service.RecipeService;
import com.refrigerator.recipe.model.vo.Recipe;
import com.refrigerator.reicpe_order.model.vo.RecipeOrder;

/**
 * @author seong
 * @date 6/4 맵핑값 변경
 * Servlet implementation class RecipeDetailController
 */

@WebServlet("/detail.recipe")
public class RecipeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인한 유저 객체 => 요리 후기 작성과 댓글  , 
		//Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		// 레시피 번호 
		// 레시피 카테고리에서 레시피 번호 받아오기
		//Recipe recipe = (Recipe)request.getAttribute("recipe");
		//int recipeNo = recipe.getRecipeNo();
		
		// 일단 명시적으로 62번 레시피를 조회했다고 기술했습니다.
		int recipeNo = 62;
		
		// 레시피 메인 정보 조회!
		Recipe rc = new RecipeService().selectRecipeDetailList(recipeNo);


		if(rc != null ) { // 레시피 정보가 있을 때 
			
			ArrayList<RecipeOrder> list = new RecipeService().selectRecipeOrder(recipeNo);
			request.setAttribute("list2", list);
			request.setAttribute("rc", rc);
			request.getRequestDispatcher("views/recipe/recipeDetailView.jsp").forward(request, response);
			
			
		/*윗부분 작업중*/

		}else { // 레시피 정보가 없을 때 
			
			request.setAttribute("errorTitleMst","레시피 정보를 찾을 수 없습니다");
			request.setAttribute("errorMsg", "삭제된 레시피 입니다.");
			request.getRequestDispatcher("views/common/user/errorPage.jsp").forward(request, response);

			
		};
		
	
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
