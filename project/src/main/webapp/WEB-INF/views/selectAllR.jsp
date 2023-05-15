<%@ page import="zipsa.entity.T_RESERVATION" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  회원이 본인 예약현황 보여주는 페이지 -->
본인 예약 리스트.
<%
    List<T_RESERVATION> list = (List<T_RESERVATION>) request.getAttribute("list");
%>
<table>
    <tr>
        <th>REV_SEQ</th>
        <th>M_ID</th>
        <th>REV_DT</th>
        <th>PET_YN</th>
        <th>STAFF_SEQ</th>
        <th>REV_NOTE</th>
        <th>REG_DT</th>
    </tr>
    <%for(int i=0;i<list.size();i++) {
        T_RESERVATION rv = list.get(i);
    %>
        <tr>
            <td><%=rv.getREV_SEQ()%></td>
            <td><%=rv.getM_ID()%></td>
            <td><%=rv.getREV_DT()%></td>
            <td><%=rv.getPET_YN()%></td>
            <td><%=rv.getSTAFF_SEQ()%></td>
            <td><%=rv.getREV_NOTE()%></td>
            <td><%=rv.getREG_DT()%></td>
        </tr>
    <% } %>
</table>

</body>
</html>