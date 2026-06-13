<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>

<%
String id = (String)session.getAttribute("custId");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Administrator only!!</title>
</head>
<body>

<%
if(id == null){
		out.println("로그인 이후 이용 가능.");
} else if (id.equals("admin")) {
%>

<h2>관리자 페이지</h2>
<p>현재 로그인 사용자 : <%= id %></p>

<h3>현재 쿠키 목록</h3>

<%
Cookie[] cookies = request.getCookies();

for(int i=0; i<cookies.length; i++){
    out.println("쿠키 이름 : " + cookies[i].getName() + "<br>");
    out.println("쿠키 값 : " + cookies[i].getValue() + "<br>");
    out.println("===================================================<br>");
}
%>

<hr>

<h3>채팅방 활동 로그</h3>

<table border="1">
<tr>
    <th>번호</th>
    <th>사용자 ID</th>
    <th>채팅방 이름</th>
    <th>활동</th>
    <th>시간</th>
</tr>
<%
//예제 16-4참고
ResultSet rs = null;
Statement stmt = null;

try{
    String sql = "SELECT * FROM chat_log";
    stmt = conn.createStatement();
    rs = stmt.executeQuery(sql);

    while(rs.next()){
    	String log_id = rs.getString("log_id");
    	String customer_id=rs.getString("customer_id");
    	String room_name = rs.getString("room_name");
    	String action = rs.getString("action");
    	String log_time = rs.getString("log_time");
%>
<tr>
    <td><%= log_id %></td>
    <td><%= customer_id %></td>
    <td><%= room_name %></td>
    <td><%= action %></td>
    <td><%= log_time %></td>
</tr>
<%
    }
} catch(SQLException ex) {
    out.println("chat_log 테이블 조회가 실패했습니다.<br>");
    out.println("SQLException: " + ex.getMessage());
} finally {
    if(rs != null)
        rs.close();
    if(stmt != null)
        stmt.close();
    if(conn != null)
        conn.close();
}
%>
</table>
<br>
<a href="createChatroom.jsp">채팅방으로 돌아가기</a>
<%
}
else{
    out.println("관리자만 이용 가능.");
}
%>
</body>
</html>