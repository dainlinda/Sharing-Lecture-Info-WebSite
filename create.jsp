<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*" %>

<!-- 전역변수 선언 및 입력 매개변수값 추출 -->
<%
	// 입력정보 한글 처리
	request.setCharacterEncoding("utf-8");

	// 수강 관련 입력정보 추출 
	//스트링 값으로 input name값 읽어옴
	String ID         = request.getParameter("ID");
	String subject    = request.getParameter("subject");
	String name       = request.getParameter("name");

	String homework  			 = request.getParameter("homework");
	String fun       			 = request.getParameter("fun");
	String benefit   			 = request.getParameter("benefit");
	String level_of_difficulty   = request.getParameter("level_of_difficulty");
	String all_favor             = request.getParameter("all_favor");

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

<%
	// 회원으로 등록 
	sql = "insert into lecture(ID, SUBJECT, NAME, HOMEWORK, FUN, BENEFIT, DIFFICULTY, FAVOR) "+ 
		  " values (?, ?, ?, ?, ?, ?, ?, ?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, ID);
	pstmt.setString(2, subject);
	pstmt.setString(3, name);
	pstmt.setString(4, homework);
	pstmt.setString(5, fun);
	pstmt.setString(6, benefit);	
	pstmt.setString(7, level_of_difficulty);
	pstmt.setString(8, all_favor);		
	pstmt.executeUpdate();
%>
		
	
<%
	} catch(SQLException e) {
		rst = "시스템에러";
		msg = e.getMessage();
		out.print("결과:"+rst+"<br>");
		out.print("내용:"+msg+"<br>");
	} finally {
		if(pstmt != null) 
		   pstmt.close();
		if(conn != null) 
			conn.close();
	}
%>

<!-- 실행 후, 분기 -->
<%
	// 수정 후, 조회화면으로 이동
	if(rst.equals("success"))
		response.sendRedirect("read.jsp");
	// DB 에러 시, 에러출력화면으로 이동 
	else
		response.sendRedirect("./error/showError.jsp?rst=" + rst + "&msg=" + msg);
%>