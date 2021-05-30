package com.refrigerator.tos.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.refrigerator.common.model.vo.PageInfo;
import com.refrigerator.tos.model.service.TosService;
import com.refrigerator.tos.model.vo.Tos;

/**
 * Servlet implementation class TosListController
 */
@WebServlet("/list.tos")
public class TosListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TosListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// -------------------------------- <페이징 처리> ------------------------------------------
		int listCount;   // 현재 총 게시글 갯수 db로 부터 조회해와야한다 /count()함수이용하면 총개수도알아올수있다. 
		int currentPage; // 현재 페이지 (즉, 사용자가 요청한 페이지)
		int pageLimit;   // 페이지 하단에 보여질 페이징바를 페이지 최대 갯수를 몇개단위로할지 (5, 7, 10개냐 등을 정할수가 있다.)
		int boardLimit;  // 한 페이지에 몇개의 게시글의 보여지게할지 최대갯수  (몇개단위로 보여지게 할것인지 )

		// 위 4개의 값을 가지고 페이지 바에 정보를 가져올것이다. 
		// 이 페이징 바도 매번 달라진다. 몇번페이지를 요청하냐에 따라서 시작수와 끝수가 달라질것이다. 
		// 또 게시글이 몇개냐에 따라서 페이지총수의 끝수도 달라질것이다. 
		// 추가적으로 더 구해야하는게 maxPage이다.
		int maxPage;     // 가장 마지막 페이지 (총페이지 수)
		int startPage;   // 페이지 하단에 보여질 페이징바의 시작수 // 얘는  currentPage , pageLimit 이거 두개러 구할것이다.
		int endPage;     // 페이지 하단에 보여질 페이징바의 끝수 (얘는 구하기 쉽다 start 수만 알면 된다.)
		
		// * listCount : 총 게시글 갯수를 sql를 통해서  조회를 해왔다 listCount에는 이제 총게시글 갯수가 들어가있는것이다.)
		listCount = new TosService().selectListCount(); 
		
		// * currentPage : 현재 페이지 (즉, 사용자가 요청한 페이지)  (화면단에서 클릭시 같이 보낸것을 가져온것)
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		// 애초에 sertvlet 호출할때에 쿼리스트링(query String ?)으로 값을넘긴상태이기에 !! 
		// getParameter로 받는것이다. 
		
		// * pageLimit : 하단에 보여질 페이징바의 페이지 최대 갯수 (페이지 목록들 몇 개 단위)
		pageLimit = 10; 
		
		// * boardLimit : 한 페이지내에 보여질 게시글 최대 갯수 (게시글 몇 개 단위)
		boardLimit = 10;
		
		// * maxPage : 제일 마지막 페이지 수 (총 페이지 수)
		/*
		 *   listCount, boardLimit에 영향을 받음  
		 *   
		 *   <공식>
		 *   ex) boardLimit : 10이라는 가정 하에 
		 *   
		 *   총 갯수  boardLimit                   maxPage
		 *   100.0   /   10   => 10.0             10
		 *   101.0   /   10   => 10.1             11 
		 *   105.0   /   10   => 10.5             11
		 *   109.0   /   10   => 10.9             11
		 *   110.0   /   10   => 11.0             11 
		 *   / 는 몫의 형태이다.
		 *   그래서 총갯수나 혹은  boardLimit을 실수형으로 바꿔주면된다.
		 *   산술연산시에 바이트 수가 더 큰애들을 따라간다.  
		 *   즉 실수값으로 나오게 한 후에!!! 올림 처리를 해주면 된다는 것이다!!! 
		 *   
		 *   <공식>
		 *   총게시글 겟수(실수형) / boardLimit  => 올림 처리하면 => maxPage
		 */
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		// 이게 공식이다. (쉽다 ) 
		
		// * startPage : 페이지 하단에 보여질 페이징바의 시작수 
		/*
		 * pageLimit, currentPage에 영향을 받음 
		 * 
		 * ex) pageLimit : 10개라고 가정
		 * 	   startPage : 1, 11, 21, 31, ....   이같이 나올수가 있다. 
		 * 					  => n * pageLimit(10) + 1
		 * 
		 * currentPage startPage(시작수) 
		 *      1          1     => 0 *  pageLimit + 1     => n=0 
		 *      5          1     => 0 *  pageLimit + 1     => n=0
		 *      10         1     => 0 *  pageLimit + 1     => n=0
		 *      
		 *      11         11    => 1 * pageLimit + 1      => n=1
		 *      15         11    => 1 * pageLimit + 1      => n=1
		 * 		20         11    => 1 * pageLimit + 1      => n=1
		 *      
		 *      1~10   => n=0
		 *      11~20   => n=1
		 *      21~30   => n=2 
		 *                       
		 *                       
		 *                n =(currentPage-1)  / pageLimit
		 *                		 0~9          / 10     => 0
		 *                       10~19        / 10     => 1
		 *                이러면 n을 알수가 있다!!! 
		 *   <공식>
		 *   startPage = n * pageLimit + 1 == (currentPage -1) / pageLimit * pageLimit(10으로가정함) + 1                    
		 */
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		// int / int 시 ! 소수점은 안나오는것을 활용한것
		
		// * endPage : 페이지 하단에 보여질 페이징바의 끝 수
		/*
		 * startPage, pageLimit에 영향을 받음 (단, maxPage에 영향을 받긴함)
		 * 
		 * ex) pageLimit : 10이라는 가정하에
		 * startPage는 말그대로 페이징바에 시작하는 페이지 수일뿐이다.              
		 * startPage : 1 => endPage : 10 
		 * startPage : 11 => endPage : 20 
		 * startPage : 21 => endPage : 30 
		 */
		endPage = startPage + pageLimit - 1;
		
		// startPage가 11이여서 endPage 20으로 됨 (근데 maxPage가 고작 13페이지 까지밖에 안된다면 ???)
		// 그럼 필요없는 14, ~20 페이지 목록이 보여진다?이래서는 안된다!! 
		// 이때는  endPage를 maxPage로 변경을 해줘야한다.
		if(endPage > maxPage) {
			endPage = maxPage;
		}

		// 지금 구해진 7개의 값을 응답할때 꺼내쓰라고 request에 담아주면 되는데!! 이왕이면 어떤 하나의 공간에 차곡차곡 담으면 어떨까 해서 
		// 페이지 정보들을 하나의 공간에 담아서 보내자!!!! vo 클래스 만들러 가자 ! pageInfo(희락님이 만들어준것 활용) 
		// 1. 페이징바 만들떄 필요한 객체
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// ★ 이제 핵심이다 위에서 페이징 처리는 모두 끝냈다 이제 실질적으로 이용약관게시슬 리스트들을 가져오자! 
		// 2. 현재 요청한 페이지 (currentPage)에 보여질 게시글 리스트 조회해오기
		ArrayList<Tos> list = new TosService().selectList(pi); 
		// tos 셈플데이터 기준으로 현재 4개의 행만이 담겨있을것이다. 
		
		// 이제 구한 pi 정보와 list정보를 request의 속성에 담아서 뿌려줄 페이지로 넘기면서 호출해주면된다!!
		request.setAttribute("pi", pi);// 페이징바 만들때 쓰라고 넘겨주는것
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/tos/adminTosPage.jsp").forward(request, response);
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
