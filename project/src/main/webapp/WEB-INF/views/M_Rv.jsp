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
<!--  회원들이 보는 나의 예약현황 페이지 		
		REV_SEQ = rEV_SEQ;
		M_ID = m_ID;
		JOB_T = jOB_T; →
		REV_DT = rEV_DT;
		PET_YN = pET_YN;
		STAFF_SEQ = sTAFF_SEQ;
		REV_NOTE = rEV_NOTE;
		REG_DT = rEG_DT; -->
<%
    List<T_RESERVATION> list = (List<T_RESERVATION>) request.getAttribute("list");
%>
<table>
    <tr>
        <th>예약번호</th>
        <th>회원ID</th>
        <th>예약일자</th>
        <th>펫유무</th>
        <th>직원이름</th> <!-- 뷰만들어서 DTO 다시 만들기 -->
        <th>요청사항</th>
        <th>등록일자</th>
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

