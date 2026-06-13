<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String custId = (String)session.getAttribute("custId");

if(custId== null){
    response.sendRedirect("login.jsp");
    return;
}
%>
<head>
    <title>CreateChatRoom</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="./resources/js/validation.js"></script>
</head>

<body class="d-flex flex-column min-vh-100 bg-light">
<fmt:setLocale value='<%= request.getParameter("language") %>' />
<fmt:bundle basename = "bundle.message">
	<div class="container py-4">
	    <%@ include file="menu.jsp" %>
	    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold"><fmt:message key="title"/></h1>
        <p class="col-md-8 fs-4">Create ChatRoom</p>      
      </div>
    </div>
    
    <div class = "row align-items-md-stretch">
    	<div class="text-end">
    		<a href="?language=ko">Korean</a> | <a href="?language=en">English</a> | <a href="logout.jsp" class="btn btn-sm btn-danger">Logout</a>
    	</div>
    	<form name="newBook" action="./processCreateChatroom.jsp" class="form-horizontal" method = "post" enctype="multipart/form-data">
    		<div class= "mb-3 row">
    			<label class="col-sm-2"><fmt:message key="roomid"/></label>
    			<div class="col-sm-3">
    				<input type="text" id ="roomId" name="roomid" class="form-control">
    			</div>
    		</div>
    		<div class="mb-3 row">
    			<label class="col-sm-2"><fmt:message key="roomname"/></label>
    			<div class="col-sm-3">
    				<input type="text" id ="room" name="roomname" class="form-control">
    			</div>
    		</div>
    		<div class="mb-3 row">
    			<label class="col-sm-2"><fmt:message key="description"/></label>
    			<div class="col-sm-5">
    				<textarea name="description" id ="description" cols="50" rows="2" class="form-control" placeholder="100자 이상 적어주세요"></textarea>
    			</div>
    		</div>
    		<div class="mb-3 row">
    			<label class="col-sm-2"><fmt:message key="roomImage"/></label>
    			<div class="col-sm-5">
    				<input type="file" name="roomImage" class="form-control">
    			</div>
    		</div>
    		<div class="mb-3 row">
    			<div class="col-sm-offset-2 col-sm-10">
    				<input type="button" class= "btn btn-primary" value ="<fmt:message key="button"/>" onclick = "CheckAddroom()">
    			</div>
    		</div>
    	</form>
    </div>
	    <%@ include file="footer.jsp" %>
   	</div>
</fmt:bundle>
</body>
</html>