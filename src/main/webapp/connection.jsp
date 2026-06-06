<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Database SQL</title>
</head>
<body>
<%
    Connection conn = null;

    String url = "jdbc:mysql://localhost:3306/chord_jspDB";
    String user = "root";
    String password = "password입력해주세요"; //사용시 password는 팀원 각자꺼 사용하면 됩니다!

    Class.forName("com.mysql.jdbc.Driver"); //전공 교재 드라이버 활용
    conn = DriverManager.getConnection(url, user, password);

    out.println("DB 연결 성공");
%>
</body>
</html>