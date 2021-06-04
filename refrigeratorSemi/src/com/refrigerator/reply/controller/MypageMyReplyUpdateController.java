package com.refrigerator.reply.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.reply.model.service.ReplyService;

/**
 * Servlet implementation class MypageMyReplyUpdateController
 */
@WebServlet("/myReplyUpdate.rpl")
public class MypageMyReplyUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageMyReplyUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//post로 넘어왔으니 인코딩 세팅해주고 
		request.setCharacterEncoding("UTF-8");

		// 참고로 얘는 update해줄때 ! modify_date도 같이 업데이트 해줘야한다. 
		int replyNo = Integer.parseInt(request.getParameter("replyNo")); 
		String replyContent = request.getParameter("replyContent");

		int result = new ReplyService().updateMyReply(replyNo, replyContent);
		
		//요청 처리후 성공했을시 실패했을시 
		if(result > 0 ) { // 성공했을 경우 => /list.tos url재요청  => 리스트페이지가 보여지도록 alert도 보여지게
			// alert문구는 세션에 담고서 url 재요청해주면된다. 
			request.getSession().setAttribute("alertMsg", "성공적으로 댓글을 수정했습니다.");
			//이제 url 재요청
			response.sendRedirect(request.getContextPath() + "/mylist.rpl?currentPage=1");
			
		}else { // 실패했을경우 error페이지가 보여지도록 에러문구 (error페이지로 forwarding 하는것)
			request.setAttribute("errorTitleMsg", "댓글 수정 실패");
			request.setAttribute("errorMsg", "뭔가 잘못됬것지? 잘찾아보시게나 ~");
			request.getRequestDispatcher("views/common/user/errorPage.jsp").forward(request, response);
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
