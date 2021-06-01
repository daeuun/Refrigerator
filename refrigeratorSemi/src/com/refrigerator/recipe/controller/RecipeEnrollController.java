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
import com.refrigerator.member.model.vo.Member;

/**
 * Servlet implementation class RecipeEnrollController
 */
@WebServlet("/enroll.rcp")
public class RecipeEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		int userNo = loginUser.getUserNo();
		
		ArrayList<MainCategory> mList = new MainCategoryService().selectMainList();
		ArrayList<SubCategory> sList = new SubCategoryService().selectSubListByMainCategory(1);
		
		
		request.setAttribute("userNo", userNo);
		request.setAttribute("mList", mList);
		request.setAttribute("sList", sList);
		
		request.getRequestDispatcher("views/recipe/recipeEnrollView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
