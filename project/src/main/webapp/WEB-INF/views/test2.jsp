<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  직원의 예약일,휴무일 받아오는 jsp -->
<table border="1">
<tr><td>이미 예약된 일<td></tr>
<c:forEach items="${Rlist}" var="dto">
<tr><td>${dto.REV_DT}</td></tr></c:forEach>
<tr><td>휴무일<td></tr>
<c:forEach items="${Hlist}" var="dto">
<tr><td>${dto.HOLI_DT}</td></tr>
</c:forEach>

</table>



</body>
</html>