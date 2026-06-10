<%@ page contentType="text/html; charset=UTF-8" %>

<%
Cookie cookie = new Cookie("saveId", "");
cookie.setMaxAge(0);
response.addCookie(cookie);

session.invalidate();
response.sendRedirect("login.jsp");
%>