<%
// DB Open: MS SQL Server
// JDBC Driver 로딩

//mssql
//Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

//mysql
//Class.forName("com.mysql.jdbc.Driver");  

//mariadb
Class.forName("org.mariadb.jdbc.Driver");  
                
// DB Open 

//mssql
//conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databasename=sunziza;user=sa;password=qazwsx99;"); 

//mysql
//conn=DriverManager.getConnection("jdbc:mysql://115.68.120.111:3306/201500000?useUnicode=true&characterEncoding=UTF-8", "201500000", "201500000");        

//mariadb
conn=DriverManager.getConnection("jdbc:mariadb://localhost:3306/sunziza", "root", "qazwsx99");        
 // DriverManager 객체로부터 Connection 객체를 얻어온다.

%>   	

