package com.refrigerator.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.category.model.service.MainCategoryService;
import com.refrigerator.category.model.service.SubCategoryService;
import com.refrigerator.category.model.vo.MainCategory;
import com.refrigerator.category.model.vo.SubCategory;
import com.refrigerator.ingre.model.vo.Ingre;
import com.refrigerator.ingre_search.model.vo.IngreSearch;
import com.refrigerator.member.model.vo.Member;
import com.refrigerator.recipe.model.service.RecipeService;
import com.refrigerator.recipe.model.vo.Recipe;
import com.refrigerator.reicpe_order.model.vo.RecipeOrder;

/**
 * Servlet implementation class MypageMyRecipeUpdateController
 */
@WebServlet("/updateMyRecipe.rcp")
public class MypageMyRecipeModifyFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageMyRecipeModifyFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");		
		
		ArrayList<MainCategory> mList = new MainCategoryService().selectMainList();
		ArrayList<SubCategory> sList = new SubCategoryService().selectSubListByMainCategory(1);
		
		// 얘도 post로 넘어오는데 가지고 노는 값이 숫자다 다만 전혀 적용도 안되고 문제도 없겠지만 일단 인코딩 작업해주자
		// 문제가 없는이유는 db에 심어져있는것을 가지고 오는것 뿐이니까 딱히 내가 받아온값이 숫자밖에없기에 문제가 없다 하지만 혹시모르니 인코팅 작업 해주자
		request.setCharacterEncoding("UTF-8");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int recipeNo = Integer.parseInt(request.getParameter("recipeNo"));
			
		Recipe myRecipe = new RecipeService().selectMyRecipe(userNo, recipeNo);
		// 아래 3개는 여러행 조회될 여지가 있다. 
		ArrayList<IngreSearch> myIngreSearch = new RecipeService().selectMyIngreSearch(recipeNo);
		ArrayList<Ingre> myIngre = new RecipeService().selectMyIngre(recipeNo);
		ArrayList<RecipeOrder> myRecipeOrder = new RecipeService().selectMyRecipeOrder(recipeNo);

		request.setAttribute("myPageNo", 4);
		request.setAttribute("myRecipe", myRecipe);
		request.setAttribute("myIngreSearch", myIngreSearch);
		request.setAttribute("myIngre", myIngre);
		request.setAttribute("myRecipeOrder", myRecipeOrder);
		request.setAttribute("userNo", userNo);
		request.setAttribute("mList", mList);
		request.setAttribute("sList", sList);
		
		request.getRequestDispatcher("views/recipe/myPageModifyRecipeView.jsp").forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
