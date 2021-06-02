package com.refrigerator.banner.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.refrigerator.banner.model.service.BannerService;
import com.refrigerator.banner.model.vo.Banner;

/**
 * Servlet implementation class AjaxAdminBannerSelectController
 */
@WebServlet("/selectBanner.ba")
public class AjaxAdminBannerSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAdminBannerSelectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bannerNo = Integer.parseInt(request.getParameter("bannerNo"));

		Banner selecedBanner = new BannerService().selectBanner(bannerNo);
		// Ajax요청시에 돌려줄 값으로는 무조건 하나밖에 보내줄수밖에없다.

		// 얘도 마찬가지로 응답할 데이터에대한 Contentype을 지정을 해줘야한다 (gson 쓴다고 해도!)
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(selecedBanner, response.getWriter()); 	
		// 값이 넘어간것이다.
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
