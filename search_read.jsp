<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>선지자: 학생들이 만들어가는 수강정보 사이트</title>
	<%@ include file="./include/include_file.inc" %>
</head>

<body>
<div class="content-wrap">
<%
	// 입력정보 한글 처리
	request.setCharacterEncoding("utf-8");

	String search = request.getParameter("search");

	// 회원 관련 객체 
	String seq        = "";
	String ID         = "";
	String subject    = "";
	String name       = "";

	String homework  			 = "";
	String fun       			 = "";
	String benefit   			 = "";
	String level_of_difficulty   = "";
	String all_favor             = "";		
		 
	// DB 관련 객체 
	Connection        conn  = null;
	PreparedStatement pstmt = null;
	ResultSet         rs    = null;
	String            sql   = "";
	String            rst   = "success";
	String            msg   = "";

	try {
%>
		<!-- DB Open -->
		<%@ include file="./include/dbOpen.inc" %>

	<!--헤더-->
	<header>
		<%@ include file="./include/menu.inc" %>

<%
	// 자동완성용 데이터 - 과목명 불러오기  
	sql = "select SUBJECT from lecture group by ID";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();			
%>
<!--자동완성 데이터-->
	<script>
	var availableTags = [

<%
	while(rs.next()){
%>
							'<%= rs.getString("SUBJECT") %>',
						
<%
	}
%>
];				
	</script>
		<!-- 검색 창 -->
		<div id="sb-search" class="sb-search">
			<form name="form1" method="post" action="search_read.jsp">
				<input class="sb-search-input" placeholder="ex)웹 프로그래밍" type="text" value="" name="search" id="search">
				<input class="sb-search-submit" type="submit" value="">
				<span class="sb-icon-search"></span>
			</form>
		</div>		
<!--자동완성-->		
	<script>
	$(document).ready(function() {
	    $("#search").autocomplete(availableTags,{ 
	        matchContains: true,
	        selectFirst: false
	    });
	});
	</script>
	</header>
	<h1>수강 정보 목록 조회</h1>

<%
	// read_more로 넘기기 위한 수강정보  
	sql = "select ID,SUBJECT,NAME,AVG(HOMEWORK) as HOMEWORK,AVG(FUN) as FUN,AVG(BENEFIT) as BENEFIT,AVG(DIFFICULTY) as DIFFICULTY,AVG(FAVOR) as FAVOR,SUBSTRING(ID,1,2) as MAJOR from lecture where subject like'"+ search + "%' group by ID";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();	
	
if (!rs.next()) {
%>
	<section data-role="content"> 
	<br>
	<h3><center>해당 과목이 없습니다.</center></h3> 
	<p>
	<h3><center>새로 생성하시겠습니까?</center></h3>

	<a href="createForm.jsp">
	<p align="center">
		<button class="button button--winona button--border-thick button--round-l button--text-upper button--size-s button--text-thick" data-text="나를 눌러요!">
		<span>새로 생성하기!</span>
		</button>
	</p>
	</a>
<%
}else{
rs.previous();
}	
%>
	<link rel="stylesheet" type="text/css" href="./include/read_list.css" />	
	<!--본문 목록-->
	<section data-role="page">	
		<div class="read_list">	
			<ul>
<%
	while(rs.next()){
%>
		<a href="read_more.jsp?ID=<%=rs.getString("ID")%>&SUBJECT=<%=rs.getString("SUBJECT")%>&NAME=<%=rs.getString("NAME")%>&HOMEWORK=<%=rs.getString("HOMEWORK")%>&FUN=<%=rs.getString("FUN")%>&BENEFIT=<%=rs.getString("BENEFIT")%>&DIFFICULTY=<%=rs.getString("DIFFICULTY")%>&FAVOR=<%=rs.getString("FAVOR")%>&MAJOR=<%=rs.getString("MAJOR")%>">
			<li>
				<span>
				<%= rs.getString("SUBJECT") %>
				<p>
				<%= rs.getString("NAME") %> 교수님

				</span>
			</li>	
		</a>

	<br>
	<h3><center>찾으시는 과목이 없으십니까?</center></h3> 
	<p>

	<a href="createForm.jsp">
	<p align="center">
		<button class="button button--winona button--border-thick button--round-l button--text-upper button--size-s button--text-thick" data-text="나를 눌러요!">
		<span>새로 생성하기!</span>
		</button>
	</p>
	</a>	
		
		
<%
	}
%>
			</ul>
		</div>	
	</section>

		
<%	 
	} catch(SQLException e) {
		rst = "시스템에러";
		msg = e.getMessage();
	} finally {
		if(rs != null) 
			rs.close();
		if(pstmt != null) 
			pstmt.close();
		if(conn != null) 
			conn.close();
	} 
%>
	</section>

<!-- 실행 후, 분기 -->
<%
// DB 에러 시, 에러 출력화면으로 이동
if(!rst.equals("success")) 
	response.sendRedirect("./error/showError.jsp?rst=" + rst + "&msg=" + msg);
%>

</div>
</body>
		<%@ include file="./include/include_file2.inc" %>	
</html>