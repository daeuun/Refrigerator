package com.refrigerator.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.member.model.service.MemberService;
import com.refrigerator.member.model.vo.Member;

/**
 * Servlet implementation class AjaxMypageMemberEmailCheckController
 */
@WebServlet("/AjaxEmailCheck.me")
public class AjaxMypageMemberEmailCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMypageMemberEmailCheckController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// 새로운 이메일 값 받아온것 
		String newEmail = request.getParameter("newEmailCheck");

		//select로 조회해본다 그러고 하나의 행을 가져오는데 만약 뭤도 없으면 비어있는게 올것이고 아니면 뭔가 담겨있는게 올것이다. 
		Member count = new MemberService().checkEmail(newEmail); 
		
		if(count != null) {
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print("true");
		}else {
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print("false");			
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
