package com.refrigerator.category.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.recipe.model.service.RecipeService;
import com.refrigerator.recipe.model.vo.Recipe;

/**
 * Servlet implementation class SearchCategoryViewController
 */
@WebServlet("/saerchCat.cat")
public class SearchCategoryViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchCategoryViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//여기 작업해주면 된다!! !!!!!!!! 
		
		
		// 페이징처리 셋팅
		int listCount; 	
		int currentPage;
		int pageLimit;	
		int boardLimit;	
						
		int maxPage;
		int startPage;
		int endPage;
						
		// ★ 여기서 부터 커스터마이징 하면됨!!! 
		listCount = new RecipeService().selectListCount();
						
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		System.out.println(currentPage);
						
		int subCatNo= Integer.parseInt(request.getParameter("sno"));
		System.out.println(subCatNo);
		
		
		pageLimit = 5;
						
		boardLimit = 12;
						
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
						
		startPage = (currentPage -1) / pageLimit * pageLimit + 1;
						
		endPage = startPage + pageLimit - 1;
						
		if(endPage > maxPage) {
			endPage = maxPage;
		}
						
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		//★★★★★  이름은 똑같이 가되!!!! 메소드를 달리해줘야해!!! 
		ArrayList<Recipe> pageList = new RecipeService().selectRecipeList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("pageList", pageList);
		
		request.getRequestDispatcher("views/recipe/recipeListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
