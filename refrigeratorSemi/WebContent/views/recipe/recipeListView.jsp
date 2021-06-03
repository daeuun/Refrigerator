<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<style>
    .outer {
        /*width: 1200px;*/
        margin: auto;
        margin-top: 50px;
    }
    .thumb-list-sec {
        width: 1000px;
        margin: auto;
    }
    .search-content {
        width: 950px;
        height: 100px;
        margin: auto;
    }
    .search-info{
        float: left;
        box-sizing: border-box;
        width: 380px;
        height: 100px;
    }
    .search-info>p{margin: 15px 0px 0px 10px;}
    #search-title{
        font-weight: bold; 
        font-size: 17px;
        color: rgb(0, 120, 52);
    }
    #search-num{
        font-size: 23px;
        font-weight: bold;
    }
    .search-btn{
        display: inline-block;
        width: 560px;
        height: 100px;
        padding-top: 30px;
    }
    .search-btn>a{
        border: 1px solid darkgray;
        font-weight: bold;
    }
    .search-btn>a:hover{
        color: white;
        background: rgb(0, 120, 52, 0.7);
    }
    .thumb-list-area {
        width: 1000px;
        margin: auto;
        margin: 30px 0 0 30px;
    }
    .thumbnail {
        border: 1px solid white;
        width: 205px;
        display: inline-block;
        margin: 14px;
    }
    .thumbnail:hover {
        cursor: pointer;
        opacity: 0.7;
        /*border: 1px solid rgb(0, 120, 51);*/
        /*background: rgba(0, 120, 52, 0.1);*/
    }
    #recipe-img img{
        box-sizing: border-box;
        border-radius: 20px;
    }
</style>

<body>

    <div class="outer">
    
    <%@include file="../common/user/menubar.jsp" %>

        <section class="thumb-list-sec">

            <div class="search-content">

                <div class="search-info">
                    <p>"<span id="search-title">간장게장</span>"에 대한 검색결과</p>
                    <p>
                        총 
                        <span id="search-num">1000</span>
                        개의 맛있는 레시피가 있습니다.
                    </p>
                </div>

                <div class="search-btn" align="right">
                   <a href="" class="btn enroll-btn">최근순</a>
                   <a href="" class="btn star-btn">별점순</a>
                   <a href="" class="btn count-btn">조회순</a>
                </div>

            </div>


            <div class="thumb-list-area">

                <div class="thumbnail" align="center">
                    <!-- input value에 각 레시피 번호-->
                    <input type="hidden" value="">
                    <div id="recipe-img">
                        <img src="<%=contextPath %>/resources/image/sampleFood.jpg" width="200" height="150">
                    </div>

                    <p style="margin-top: 5px;">
                        <b>닭가슴살 샐러드</b><br>
                        <span style="font-size:14px">마법의 소라고동</span> <br>
                        <span style="font-size:14px">별점 : 3.5(5.0) &nbsp;|&nbsp; 조회수 : 0</span> 
                    </p>

                </div>
                <div class="thumbnail" align="center">
                    <input type="hidden" value="">
                    <div id="recipe-img">
                        <img src="resources/img/salad.jpeg" width="200" height="150">
                    </div>

                    <p style="margin-top: 5px;">
                        <b>닭가슴살 샐러드</b><br>
                        <span style="font-size:14px">마법의 소라고동</span> <br>
                        <span style="font-size:14px">별점 : 3.5(5.0) &nbsp;|&nbsp; 조회수 : 0</span> 
                    </p>

                </div>
                <div class="thumbnail" align="center">
                    <input type="hidden" value="">
                    <div id="recipe-img">
                        <img src="resources/img/salad.jpeg" width="200" height="150">
                    </div>

                    <p style="margin-top: 5px;">
                        <b>닭가슴살 샐러드</b><br>
                        <span style="font-size:14px">마법의 소라고동</span> <br>
                        <span style="font-size:14px">별점 : 3.5(5.0) &nbsp;|&nbsp; 조회수 : 0</span> 
                    </p>

                </div>
                <div class="thumbnail" align="center">
                    <input type="hidden" value="">
                    <div id="recipe-img">
                        <img src="resources/img/salad.jpeg" width="200" height="150">
                    </div>

                    <p style="margin-top: 5px;">
                        <b>닭가슴살 샐러드</b><br>
                        <span style="font-size:14px">마법의 소라고동</span> <br>
                        <span style="font-size:14px">별점 : 3.5(5.0) &nbsp;|&nbsp; 조회수 : 0</span> 
                    </p>

                </div>
                <div class="thumbnail" align="center">
                    <input type="hidden" value="">
                    <div id="recipe-img">
                        <img src="resources/img/salad.jpeg" width="200" height="150">
                    </div>

                    <p style="margin-top: 5px;">
                        <b>닭가슴살 샐러드</b><br>
                        <span style="font-size:14px">마법의 소라고동</span> <br>
                        <span style="font-size:14px">별점 : 3.5(5.0) &nbsp;|&nbsp; 조회수 : 0</span> 
                    </p>

                </div>
                
            </div>

        </section>
        
        <br>
        <!-- 페이징 -->
        
        
    </div>
    <script>

        $(function () {

            $(".thumbnail").click(function () {

                location.href = "<%=contextPath%>/detail.recipe?rno=" + $(this).children().eq(0).val();
            })

        })

    </script>

</body>
</html>