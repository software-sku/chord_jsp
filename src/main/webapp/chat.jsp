<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
    <link href="./resources/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="d-flex flex-column min-vh-100 bg-light">
<fmt:setLocale value='<%= request.getParameter("language") %>' />
<fmt:bundle basename = "bundle.message"/>
    <%@ include file="menu.jsp" %>
    <main class="container-fluid flex-grow-1 px-0">
        <div class="row g-0 h-100">
            
            <aside class="col-3 border-end bg-white d-flex flex-column">
                <%@ include file="chatSidebar.jsp" %>
            </aside>

            <section class="col-9 d-flex align-items-start flex-col justify-content-center p-4">
                <div class="col bg-white rounded-4 p-4 w-100" style="max-width: 720px;">
                    <h2 class="mb-3">전체채팅방에 오신 것을 환영합니다</h2>
                    <p class="mb-0">
                        채팅이 이곳에 보이게 됩니다.
                    </p>
                     <textarea rows="2" cols="100"></textarea>
                </div>
            </section>
            

        </div>
    </main>
    <div class="text-end">
    		<a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
    </div>
    <%@ include file="footer.jsp" %>

</body>
</html>