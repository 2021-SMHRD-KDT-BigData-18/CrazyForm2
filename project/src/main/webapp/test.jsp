<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"  %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1">
<tr>
				<td>선택</td>
				<td>예약일자</td>
				<td>예약주소</td>
				<td>담당매니저</td>
			</tr>
			<c:forEach items="${list}" var="dto">
			<tr><td name="staff_seq" value="${dto.STAFF_SEQ}">√</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${dto.REV_DT}"/></td>
 				<td>${dto.m_ADDR}</td>
 				<td>${dto.STAFF_NAME}</td>
			</c:forEach>
			
</table>
</body>
</html>