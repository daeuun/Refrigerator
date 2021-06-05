package com.refrigerator.recent_recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.member.model.vo.Member;
import com.refrigerator.recent_recipe.model.service.RecentRecipeService;
import com.refrigerator.recent_recipe.model.vo.RecentRecipe;

/**
 * Servlet implementation class MypageRecentRecipeListController
 */
@WebServlet("/myRecent.rcp")
public class MypageRecentRecipeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageRecentRecipeListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String before = request.getParameter("rcpNo");
		String[] needWork;
		String[] recentRecipeNo = new String[6];
		if(!before.equals("undefined")) {
			needWork = before.split(",");
		}else {
			needWork = new String[]{"0","0","0","0","0","0"};			
		}
				
		if(needWork.length != 6) {
			for(int i=0; i<needWork.length; i++) {
				recentRecipeNo[i] = needWork[i];
			}
		}else {
			recentRecipeNo = needWork;
		}
		
		for(int i=0; i<recentRecipeNo.length ; i++) {
			if((recentRecipeNo[i]) == null) {
				recentRecipeNo[i] = "0";
			}
		}
			
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		
		ArrayList<RecentRecipe> list = new ArrayList<>();
		ArrayList<RecentRecipe> firstRow = new ArrayList<>();
		ArrayList<RecentRecipe> secondRow = new ArrayList<>();

		if(loginUser != null) {
			list = new RecentRecipeService().selectList(recentRecipeNo); 
			// 무조건 6개 담겨있다! 
			
			if(list.size()<4) {
				// 3개 이하로 잡히면 그떄는 전체 리스트에 접근해줘도 된다. 
				firstRow = list;			
			}else {
				// 혹여나 데이터의 갯수가 음 .. 4개가 넘고 이게 4개일지 5개일지 6개일지 모를떄는 !! 
				// 일단은 3개가 넘는 다는 소리이다. 이렇게 되면 최소 4개 까지는 있다는 것이다. 
				// 그럼 끝인덱스만을 알아오면 되는데 음 .. 
				// E e = list.get(list.size() - 1);
				for(int i=0; i<3; i++){
					firstRow.add(list.get(i));
				}
				for(int i=3; i<list.size(); i++) {
					secondRow.add(list.get(i));
				}
			}
			
		}

		request.setAttribute("myPageNo", 2);

		// session에 지금 로그인 정보가 담겨있어야지만 이를 가지고 들어가서 작업할수가 있다. 
		if(loginUser == null) {// 로그인 정보가 담겨있지 않다면 ! 로그인 페이지로 이동 
			request.getRequestDispatcher("views/member/login.jsp").forward(request, response);
		}else {// 로그인 정보 담겨있으면 ! member 수정쪽으로 이동 
			request.setAttribute("firstRow", firstRow);
			request.setAttribute("secondRow", secondRow);

			request.getRequestDispatcher("views/recent_recipe/myPageRecentRecipe.jsp").forward(request, response);
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
