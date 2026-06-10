<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>

<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

Statement stmt = null;
ResultSet rs = null;

try {
    String sql = "SELECT * FROM customer WHERE id='" + id + "' AND passwd='" + passwd + "'";
    //ch16-executeQuery()메소드 예제 사용

    stmt = conn.createStatement(); //sql실행객체생성
    rs = stmt.executeQuery(sql); //select결과를 ResultSet에 저장

    if(rs.next()) {
        session.setAttribute("custId", id);
        session.setAttribute("custName", rs.getString("name"));
        
        //쿠키 저장
        Cookie cookie = new Cookie("saveId", id);
        cookie.setMaxAge(-1); //채팅 대화 내용 유출 방지(브라우저 종료시 닫기)
        response.addCookie(cookie);
        
        response.sendRedirect("createChatroom.jsp");
        
        out.println("로그인 완료<br>");
        out.println(id + "님.");
    } else {
        out.println("로그인 실패");
    }

} catch(SQLException ex) {
    out.println("로그인 실패<br>");
    out.println("SQLException: " + ex.getMessage());
} finally {
    if(rs != null) rs.close();
    if(stmt != null) stmt.close();
    if(conn != null) conn.close();
}
%>