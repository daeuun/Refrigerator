package com.refrigerator.reply.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.member.model.vo.Member;
import com.refrigerator.reply.model.service.ReplyService;
import com.refrigerator.reply.model.vo.AdmReply;
import com.refrigerator.reply.model.vo.Reply;
import com.refrigerator.tos.model.service.TosService;
import com.refrigerator.tos.model.vo.Tos;

/**
 * Servlet implementation class MypageMyReplyListController
 */
@WebServlet("/mylist.rpl")
public class MypageMyReplyListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageMyReplyListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");

		int userNo;
		// 필요한 변수 세팅해주자 ~
		if(loginUser != null) {
			userNo = loginUser.getUserNo();
		}else {
			userNo = 0;
		}
		
		//System.out.println(userNo);
		
		//페이징 처리 
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		int maxPage;
		int startPage;
		int endPage;
						
		//먼저 내가 쓴 댓글이 총 몇개인지 가져오자~ (로그인한 유저의 번호를 넘겨줘야한다.)
		listCount = new ReplyService().selectMyReplyListCount(userNo); // 내가쓴 댓글수 달려있음
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		pageLimit = 10;
		
		boardLimit = 5;
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		startPage = (currentPage-1)/pageLimit * pageLimit+1;
		
		endPage = startPage + pageLimit -1;
		if(endPage>maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount,currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
		
		ArrayList<Reply> list = new ReplyService().selectMyReplyList(pi, userNo);		
		
		// session에 지금 로그인 정보가 담겨있어야지만 이를 가지고 들어가서 작업할수가 있다. 
		// deadcode 뜨는데 절대 dead코드 아니다! 나중에 로그인을 안한 사람이 url을 타고들어오는것을 방지하는것이다.
		if(loginUser == null) {// 로그인 정보가 담겨있지 않다면 ! 로그인 페이지로 이동 
			request.getRequestDispatcher("views/member/login.jsp").forward(request, response);
		}else {// 로그인 정보 담겨있으면 ! member 수정쪽으로 이동 
			request.setAttribute("myPageNo", 5);
			request.setAttribute("pi", pi);// 페이징바 만들때 쓰라고 넘겨주는것
			request.setAttribute("replyList", list);
			request.getRequestDispatcher("views/reply/myPageReplyPageWithModal.jsp").forward(request, response);
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
