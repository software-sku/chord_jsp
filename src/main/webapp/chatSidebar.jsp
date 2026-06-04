<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<div class="d-flex flex-column h-100 p-3">
    <div class="pb-3 border-bottom">
        <h5 class="mb-3">채팅방</h5>
        <input type="text" class="form-control" placeholder="채팅방 검색">
    </div>

    <nav class="flex-grow-1 overflow-auto pt-3" aria-label="채팅방 목록">
        <div class="list-group list-group-flush">
            <a href="./createChatroom.jsp" class="list-group-item list-group-item-action active">채팅방 만들기</a>
            <a href="#" class="list-group-item list-group-item-action">전체 채팅방</a>
        </div>
        <div class="flex-grow-1 overflow-auto pt-3">
        	<a href="logout.jsp" class="btn btn-sm btn-success pull right">logout</a>
        </div>
    </nav>
</div>