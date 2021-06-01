package com.refrigerator.nav_menu.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		int hOrder = Integer.parseInt(request.getParameter("home"));
		int ctOrder = Integer.parseInt(request.getParameter("category"));
		int eOrder = Integer.parseInt(request.getParameter("event"));
		int rOrder = Integer.parseInt(request.getParameter("recipe"));
		int csOrder = Integer.parseInt(request.getParameter("cs"));
		
		System.out.println(hOrder);
		System.out.println(ctOrder);
		System.out.println(eOrder);
		System.out.println(rOrder);
		System.out.println(csOrder);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
