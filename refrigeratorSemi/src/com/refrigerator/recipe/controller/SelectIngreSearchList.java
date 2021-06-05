package com.refrigerator.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.ingre_search.model.vo.IngreSearch;
import com.refrigerator.recipe.model.service.RecipeService;

/**
 * Servlet implementation class SelectIngreSearchList
 */
@WebServlet("/ingreSearch.recipe")
public class SelectIngreSearchList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectIngreSearchList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int recipeNo = Integer.parseInt(request.getParameter("recipeNo"));
		
		ArrayList<IngreSearch> list =  new RecipeService().selectIngreSearchList(recipeNo);
		
		if(list.isEmpty()) {
			
			response.sendRedirect(request.getContextPath()+"/detail.recipe?rno=" + recipeNo);
			
		}else {
			
			
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
