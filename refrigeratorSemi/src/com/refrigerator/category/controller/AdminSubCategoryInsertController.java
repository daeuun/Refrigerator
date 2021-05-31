package com.refrigerator.category.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.category.model.service.SubCategoryService;
import com.refrigerator.category.model.vo.SubCategory;

/**
 * Servlet implementation class AdminSubCategoryInsertController
 */
@WebServlet("/subCatEnroll.cat")
public class AdminSubCategoryInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSubCategoryInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		int refMainCatNo = Integer.parseInt(request.getParameter("refMainCatNo")); 
		String subCatName = request.getParameter("subCatName");
		
		SubCategory sc = new SubCategory();
		sc.setCategoryMainNo(refMainCatNo);
		sc.setIngredientName(subCatName);
	
		int result = new SubCategoryService().insertSubCategory(sc);
		
		//요청 처리후 성공했을시 실패했을시 
		if(result > 0 ) { // 성공했을 경우
			request.getSession().setAttribute("alertMsg", "성공적으로 소분류 카테고리가 등록되었습니다.");
			//이제 url 재요청
			response.sendRedirect(request.getContextPath() + "/list.cat");
			
		}else { // 실패했을경우 error페이지가 보여지도록 에러문구 (error페이지로 forwarding 하는것)
			request.setAttribute("errorTitleMsg", "db에 저장실패");
			request.setAttribute("errorMsg", "error 발생");
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
