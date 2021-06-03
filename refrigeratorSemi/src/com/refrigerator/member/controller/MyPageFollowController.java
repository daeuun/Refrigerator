package com.refrigerator.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.follow.model.service.FollowService;
import com.refrigerator.follow.model.vo.Follow;
import com.refrigerator.member.model.service.MemberService;
import com.refrigerator.member.model.vo.Member;

/**
 * 마이페이지 
 * Servlet implementation class MyPageFollowController
 */
@WebServlet("/deleteForm.fol")
public class MyPageFollowController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageFollowController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		int userNo = loginUser.getUserNo();
		
		ArrayList<Follow> folList = new FollowService().selectFollowList(userNo);
		
		ArrayList<Member> mList = new MemberService().selectMemberCount(folList);
		
		
		
		request.setAttribute("myPageNo", 8);
		request.setAttribute("", folList);
		
		request.getRequestDispatcher("views/member/myPageFollowDeleteView.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
