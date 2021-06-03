package com.refrigerator.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.member.model.vo.Member;

/**
 * Servlet implementation class MyPageMemberModifiyViewController
 */
@WebServlet("/myInfo.me")
public class MyPageMemberModifiyViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageMemberModifiyViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//해당 페이지 뽑아올때 따로 db까지 갈필요가 없다 loginUser쪽에 정보가 심어져있어서 가져오기만 하면된다.
		//다만 중요한것은 !! 로그인 안한사람이 url타고 들어오면 문제가 되기에 이를 막기위해서 장치를 마련해야한다. 
				
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		
		request.setAttribute("myPageNo", 1);
		
		// session에 지금 로그인 정보가 담겨있어야지만 이를 가지고 들어가서 작업할수가 있다. 
		if(loginUser == null) {// 로그인 정보가 담겨있지 않다면 ! 로그인 페이지로 이동 
			request.getRequestDispatcher("views/member/login.jsp").forward(request, response);
		}else {// 로그인 정보 담겨있으면 ! member 수정쪽으로 이동 
			request.getRequestDispatcher("views/member/myPageMemModify.jsp").forward(request, response);
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
