package com.refrigerator.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.member.model.vo.Member;
import com.refrigerator.recipe.model.service.RecipeService;
import com.refrigerator.recipe.model.vo.Recipe;
import com.refrigerator.reply.model.service.ReplyService;

/**
 * Servlet implementation class MypageMyRecipeListController
 */
@WebServlet("/mylist.rcp")
public class MypageMyRecipeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageMyRecipeListController() {
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
			userNo = 0; //2중으로 막는 장치이다 어찌저찌 로그인안하고도 해당 내 레시피쪽을 왔는데 여기서 일단 로그인페이지로 넘기지만 이것도 뚫는다면 ! 
			            // 화면에 내가 뿌려줄 값을 list에 담아올때 아무것도 담아오지 않기 위함이다. 
		}
				
		//페이징 처리 
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		int maxPage;
		int startPage;
		int endPage;
						
		// ★★★★ 1. 먼저 로그인한 유저의 번호를 넘겨서 해당 유저가 작성한 recipe갯수를 가져오자!! 
		listCount = new RecipeService().selectMyRecipeListCount(userNo); // 내가쓴 댓글수 달려있음
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		pageLimit = 10;
		
		boardLimit = 5; //보여질 게시글은 5개로 한정함 
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		startPage = (currentPage-1)/pageLimit * pageLimit+1;
		
		endPage = startPage + pageLimit -1;
		if(endPage>maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount,currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
		
		// ★★★★ 2. 두번째로 db갔다오는것은 해당 유저가 작성한 레시피에 접근을 하되 거기서 원하는 정보를 담어서 가져오자!!
		ArrayList<Recipe> list = new RecipeService().selectMyRecipeList(pi, userNo);		
		
		// session에 지금 로그인 정보가 담겨있어야지만 이를 가지고 들어가서 작업할수가 있다. 
		// deadcode 뜨는데 절대 dead코드 아니다! 나중에 로그인을 안한 사람이 url을 타고들어오는것을 방지하는것이다.
		if(loginUser == null) {// 로그인 정보가 담겨있지 않다면 ! 로그인 페이지로 이동 
			request.getRequestDispatcher("views/member/login.jsp").forward(request, response);
		}else {// 로그인 정보 담겨있으면 ! member 수정쪽으로 이동 
			request.setAttribute("myPageNo", 4);
			request.setAttribute("pi", pi);// 페이징바 만들때 쓰라고 넘겨주는것
			request.setAttribute("myRecipeList", list);
			request.getRequestDispatcher("views/recipe/myPageRecipeListView.jsp").forward(request, response);
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
