<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>선지자: 학생들이 만들어가는 수강정보 사이트</title>
	<%@ include file="./include/include_file.inc" %>		
	<!--덧글 입력, 출력-->	
    <link rel="stylesheet" type="text/css" href="./include/textarea.css" />
	<link rel="stylesheet" type="text/css" href="./include/comment_screen.css" />

<%
	// 키를 읽어옴
	String ID 			= request.getParameter("ID");
	String SUBJECT  	= request.getParameter("SUBJECT");
	String NAME 		= request.getParameter("NAME");
	String HOMEWORK 	= request.getParameter("HOMEWORK");
	String FUN 			= request.getParameter("FUN");
	String BENEFIT  	= request.getParameter("BENEFIT");
	String DIFFICULTY   = request.getParameter("DIFFICULTY");
	String FAVOR 		= request.getParameter("FAVOR");
	String MAJOR 		= request.getParameter("MAJOR");
	
	// DB 관련 객체 
	Connection        conn  = null;
	PreparedStatement pstmt = null;
	ResultSet         rs    = null;
	
	PreparedStatement pstmt2 = null;
	ResultSet         rs2    = null;
	
	String            sql   = "";
	String            sql2   = "";

	String            rst   = "success";
	String            msg   = "";
	
	try {
%>
			
	<%@ include file="./include/dbOpen.inc" %>	

		
<%	//응답자 수 세기
	sql2 = "select count(*) as cnt from lecture where ID = ?";
	pstmt2 = conn.prepareStatement(sql2);
	pstmt2.setString(1, ID);
	rs2 = pstmt2.executeQuery();
	
	int cnt = 0;
	rs2.next();
	cnt           = rs2.getInt("cnt");
%>	

<!--하이차트-->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script type="text/javascript">
$(function () {

    Highcharts.data({
        csv: document.getElementById('tsv').innerHTML,   //밑에 tsv로 부터 데이터 받아옴
        itemDelimiter: '\t',
        parsed: function (columns) {

            var five = {},
                fiveData = [],
                versions = {}

            $.each(columns[0], function (i, name) {
                var brand,
                    version;

                if (i > 0) {

                    // Split into brand and version
                    brand = name.replace(brand, '');

                    // Create the main data
                    if (!five[brand]) {
                        five[brand] = columns[1][i];
                    }

                }
                
            });

            $.each(five, function (name, y) {
                fiveData.push({ 
                    name: name, 
                    y: y
                });
            });


			
			
			
            // Create the chart
            $('#container').highcharts({
                chart: {
                    type: 'column'
                },
				//주 제목
                title: {
                    text: '<%= SUBJECT%> 평가 평균 결과'
                },
				//서브 제목
                subtitle: {
                    text: '응답자 수:<%= cnt%>'
                },
				//척도 이름 묶은 것인듯
                xAxis: {
                    type: 'category'
                },
				//y선 이름
                yAxis: {
                    title: {
                        text: '5점 척도'
                    }
                },
                legend: {
                    enabled: false
                },
				//그래프 위에 적힌 숫자
                plotOptions: {
                    series: {
                        borderWidth: 0,
                        dataLabels: {
                            enabled: true,
                            format: '{point.y:.1f}'
                        }
                    }
                },
				//말풍선
                tooltip: {
                    headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                    pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}</b><br/>'
                }, 
				//말풍선 이름?
                series: [{
                    name: '평가 결과',
                    colorByPoint: true,
                    data: fiveData
                }]
            })

        }
    });
});
</script>
</head>
<div class="content-wrap">

<body>
	<style>
	.menu-button{
		right: 75%;
	}
	</style>
	<header id="top">
		<%@ include file="./include/menu.inc" %>
	</header>
	<h1>수강 정보 과목 조회</h1>

		<!--하이차트-->
		<script src="./js/highcharts.js"></script>
		<script src="./js/modules/data.js"></script>
		<script src="./js/modules/drilldown.js"></script>
<style>
button{
	float:right;
}
</style>
	<!--본문 목록-->
	<section data-role="page">
		<h3><center><%= SUBJECT%></center><h3>
	<a href="addForm.jsp?ID=<%=ID%>&SUBJECT=<%=SUBJECT%>&NAME=<%=NAME%>">	
	<p align="center">
		<button class="button button--winona button--border-thick button--round-l button--text-upper 
		button--size-s button--text-thick" data-text="수강정보추가">
		<span>수강정보추가</span>
		</button>
	</p>
	</a>

	
		학수 번호:<%= ID%><p>
		<%= NAME%> 교수님<p>
		<!--하이차트-->
		<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
		<!--교양 전공 여부 / 문자라서 연산자 말고 .equals 사용-->
		<% if(MAJOR.equals("KY")){
			out.print("교양 과목");
		} else {
			out.print("전공 과목");
		}
			%>
		<p>

<%
	//덧글 추출
	sql = "select * from comment where ID = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, ID);	
	rs = pstmt.executeQuery();
%>
		
		<!--덧글 입력-->
		<form method="post" action="comment_create.jsp">
		    <input type=hidden name="ID" value="<%=ID%>"></input>
			<div class="comment">		
			<h1>덧글</h1><br><br>
			<font color="#F3F3F3">이모티콘 사용 안 됩니다.</font>
			<textarea name="comment" id="comment" rows="5" style="width:100%;margin-bottom:10px;" class="jMax"></textarea>
			<input type="submit" id="posting" value="입력하기" />
			</div>	
		</form>
		<!--덧글 출력-->
		<section class="content">
			덧글란
			<div class="box bg">
				<ul>
				<%
				while(rs.next()){
				%>
				<li>익명:&nbsp;<%= rs.getString("CONTENTS")%></li><hr>
				<%
						}
				%>
				</ul>
			</div>
		</section>		
	</section><!--본문 목록-->
	
			<a href=#top>
			<center>
			<h3>맨 위로</i></h3>
			</center>
			</a>
						

<!-- 하이차트 데이터 -->
<pre id="tsv" style="display:none">five	fiveData
과제량 	<%= HOMEWORK%>
재미 	    <%= FUN%>
유익함 	<%= BENEFIT%>
수업난이도 	<%= DIFFICULTY%>
전체만족도 	<%= FAVOR%>
</pre>


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

</div>
</body>
		<%@ include file="./include/include_file2.inc" %>	
</html>