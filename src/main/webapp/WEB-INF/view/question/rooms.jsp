<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅방들</title>
</head>
<body>
	<ul>
		<c:forEach var="cr" items="${list}">
			<li><a href="${pageContext.request.contextPath}/chat?chattingRoomNo=${cr.chattingRoomNo}">${cr.chattingRoomNo}</a></li>
		</c:forEach>
	</ul>
	
	<form action="${pageContext.request.contextPath}/question/rooms" method="post">
            <input type="submit" value="개설">
    </form>
</body>
</html>