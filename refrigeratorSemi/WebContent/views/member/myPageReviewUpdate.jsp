<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.refrigerator.common.model.vo.PageInfo,
				 com.refrigerator.recipe.model.vo.Review,
				 java.util.ArrayList"%>
<%
	ArrayList<Review> list = (ArrayList<Review>) request.getAttribute("list");

PageInfo pi = (PageInfo) request.getAttribute("pi");

int currentPage = pi.getCurrentPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.outer {
	width: 890px;
	height: 460px;
	padding-top: 10px;
}

.menu-path>label {
	text-decoration: underline;
}

.menu-title {
	width: 700px;
	font-size: 18px;
	color: rgb(0, 102, 51);
	font-weight: 600;
	border-bottom: 4px solid rgb(0, 102, 51);
	margin-bottom: 0;
}

.review-table>thead>tr {
	height: 30px;
	font-size: 16px;
}

.review-table>tbody>tr {
	height: 150px;
}

table tr {
	border-bottom: 2px solid rgb(188, 188, 188);
}

.allCheckbox {
	margin-top: 5px;
	padding-left: 20px;
	font-weight: 600px;
}

button {
	border: none;
}

.current-page {
	background-color: rgb(0, 102, 51);
	color: white;
}

.count-area {
	color: orange;
}
</style>
</head>
<body>

	<%@ include file="../common/user/menubar.jsp"%>
	<%@ include file="../common/user/myPageVerticalNav.jsp"%>

	<div class="outer">

		<div class="menu-path" style="font-size: 12px;">
			마이페이지 > <label>후기&별점관리</label>
		</div>

		<br>

		<div class="menu-title">
			<label>후기&별점관리</label>
		</div>


		<div class="prof-content">
			<table class="review-table">

				<thead style="text-align: center;">
					<tr>
						<th width="50"></th>
						<th width="120"></th>
						<th width="60">번호</th>
						<th width="240">제목</th>
						<th width="100">별점</th>
						<th width="130">작성일</th>
					</tr>
				</thead>

				<tbody align="center">
					<form action="delete.rv">
						<%
							if (list.isEmpty()) {
						%>
						<tr>
							<td colspan="6">작성하신 요리 후기가 없습니다.</td>
						</tr>
						<%
							} else {
						%>
						<%
							for (int i = 0; i < list.size(); i++) {
						%>
						<tr>
							<td><input type="checkbox" name="deleteCheck<%=i + 1%>"
								value="<%=list.get(i).getReviewNo()%>"></td>
							<td><img src="<%=list.get(i).getReviewImg()%>" width="100"
								height="100"></td>
							<td><%=list.get(i).getReviewNo()%></td>
							<td width="200"><%=list.get(i).getReviewContent()%></td>
							<td>★<%=list.get(i).getStar()%></td>
							<td><%=list.get(i).getModifyDate()%></td>
						</tr>
						<%
							}
						%>
						<%
							}
						%>

						<!-- The Modal -->
						<div class="modal fade" id="delete">
							<div class="modal-dialog">
								<div class="modal-content">

									<!-- Modal Header -->
									<div align="right">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>

									<!-- Modal body -->
									<div class="modal-body" style="margin:auto">
										<p>
											<span style="color: red">선택한 요리 후기를 삭제</span>하시겠습니까?
										</p>
									</div>

									<div class="modal-btn">
										<button type="button" data-dismiss="modal" class="btn btn-secondary btn-sm">취소</a> 
										<button type="submit" class="btn btn-danger btn-sm">삭제</a>
									</div>

								</div>
							</div>
						</div>

					</form>
				</tbody>

			</table>


			<div class="allCheckbox">
				<input type="checkbox" id="all-checkbox"> &nbsp;전체선택
				<button class="btn btn-danger btn-sm" data-toggle="modal"
					data-target="#delete">삭제</button>
			</div>

			<br>
			<div align="center" class="paging-area">
				<%
					if (currentPage != 1) {
				%>
				<button
					onclick="location.href='<%=contextPath%>/review.me?currentPage=<%=currentPage - 1%>';">&lt;</button>
				<%
					}
				%>
				<%
					for (int p = startPage; p <= endPage; p++) {
				%>
				<%
					if (p != currentPage) {
				%>
				<button
					onclick="location.href='<%=contextPath%>/review.me?currentPage=<%=p%>';"><%=p%></button>
				<%
					} else {
				%>
				<button class="cp" disabled><%=p%></button>
				<%
					}
				%>
				<%
					}
				%>
				<%
					if (currentPage != maxPage) {
				%>
				<button
					onclick="location.href='<%=contextPath%>/review.me?currentPage=<%=currentPage + 1%>';">&gt;</button>
				<%
					}
				%>
			</div>

			<br>
		</div>

	</div>

	<script>
		$(function() {
			var $xx = $(".review-table input[type=checkbox]");

			$("#all-checkbox").click(function() {

				if ($(this).is(":checked")) {
					$xx.attr("checked", true);
					$xx.prop("checked", true);
				} else {
					$xx.attr("checked", false);
					$xx.prop("checked", false);
				}

				console.log($xx);
			})
		})
		/*
		var on1 = 0;
		var on2 = 0;
		var on3 = 0;

		$(document).on("change", "input[class=delete-checkbox1]", function() {
			if (on1 = 0) {
				$("input[name=deleteRno1]").val($(this).val());
				on1++;
			} else {
				$("input[name=deleteRno1]").val(null);
				on1--;
			}
		})

		$(document).on("change", "input[class=delete-checkbox2]", function() {
			if (on2 = 0) {
				$("input[name=deleteRno2]").val($(this).val());
				on2++;
			} else {
				$("input[name=deleteRno2]").val(null);
				on2--;
			}
		})

		$(document).on("change", "input[class=delete-checkbox3]", function() {
			console.log(on3);
			if (on3 = 1) {
				$("input[name=deleteRno3]").val(null);
				on3--;
			} else if (on3 = 0) {
				$("input[name=deleteRno3]").val($(this).val());
				on3++;
			}
		})
		*/
	</script>


</body>
<style>
/*--모달 영역 */
.modal-content { /*모달창 위치*/
	margin: auto;
	margin-top: 200px;
}

.modal-btn {
	text-align: center;
	margin: 25px 35px;
}

.modal-btn>button {
	width: 100px;
	height: 35px;
	font-size: 16px;
	margin: 0px 25px 0px 25px;
}

.btn-secondary {
	background: rgb(222, 222, 222);
	color: black;
	border: none;
}

.close {
	border: 1px solid black;
	font-size: 40px;
}
</style>

</html>