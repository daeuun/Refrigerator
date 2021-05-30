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
 * Servlet implementation class TosModifyDeleteFormController
 */
@WebServlet("/detail.tos")
public class TosModifyDeleteFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TosModifyDeleteFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int tosNo = Integer.parseInt(request.getParameter("bno"));
		
		System.out.println(tosNo);
		
		Tos t = new TosService().selectTos(tosNo);
				
		request.setAttribute("tos", t);
		
		request.getRequestDispatcher("views/tos/adminTosModifyAndDeletePage.jsp").forward(request, response);
		// adminTosPage.jsp 페이지 가서 작업해주자 !!
		// ★★★★ 그리고 나중에는 이 servlet을 호출해주는 방식으로 사용하면된다!!!! (여기서는 새로운 페이지로 넘어가기에 !! AJAX를 사용하는게 아니다!)
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
