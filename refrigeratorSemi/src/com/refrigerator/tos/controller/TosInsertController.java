package com.refrigerator.tos.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.tos.model.service.TosService;
import com.refrigerator.tos.model.vo.Tos;

/**
 * Servlet implementation class TosInsertController
 */
@WebServlet("/insert.tos")
public class TosInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TosInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//post 방식으로 넘어온다 일단 인코딩 세팅부터 해줘라 
		request.setCharacterEncoding("UTF-8");
		
		// Tos vo 객체 만들어놨으니 담아서 가자 총 5개 담는다. 
		String tosTitle = request.getParameter("tosTitle"); 
		String tosCategory = request.getParameter("tosCategory"); 
		String tosPage = request.getParameter("tosPage");
		String tosContent = request.getParameter("tosContent");
		String tosNote = request.getParameter("tosNote");
		
		
		Tos t = new Tos();
		t.setTosTitle(tosTitle);
		t.setTosCategory(tosCategory);
		t.setTosPage(tosPage);
		t.setTosContent(tosContent);
		t.setTosNote(tosNote);
		
		//tosNo가 0인 이유는 !!int형 필드 초기값이 0이기 떄문에 자연스러운 것이다. 
		//System.out.println(t);
		
		int result = new TosService().insertTos(t);
		
		//요청 처리후 성공했을시 실패했을시 
		if(result > 0 ) { // 성공했을 경우 => /list.tos url재요청  => 리스트페이지가 보여지도록 alert도 보여지게
			// alert문구는 세션에 담고서 url 재요청해주면된ㄷ다. 
			request.getSession().setAttribute("alertMsg", "성공적으로 이용약관이 등록되었습니다.");
			//이제 url 재요청
			response.sendRedirect(request.getContextPath() + "/list.tos?currentPage=1");
			
		}else { // 실패했을경우 error페이지가 보여지도록 에러문구 (error페이지로 forwarding 하는것)
			request.setAttribute("errorTitleMsg", "db에 저장실패");
			request.setAttribute("errorMsg", "1. tosContent가 너무 길어서일수도 있고 다른 이유일수도 있다.");
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
