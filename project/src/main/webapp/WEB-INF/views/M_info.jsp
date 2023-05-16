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

<!-- 예약내역(예약현황+내정보)
*if user=null면 goLogin.do 으로 돌아가기
★버튼에서 내정보관리 버튼 누르면 정보관련내용 나오기 Tdto에 정보관련 내용 담겨있음 get으로 받아오면됨
->버튼에서 탈퇴하기 버튼 누르면 "/delete.do" 이동 -->






<!--  예약내역
*예약현황 보기 버튼 누르면 예약현황 출력 Rlist에 담겨있음 하나씩 출력해서 보여주도록
 -->
 
 
 
 
 
<!--  회원들이 보는 나의 예약현황 페이지 		
		REV_SEQ = rEV_SEQ;
		M_ID = m_ID;
		JOB_T = jOB_T;
		REV_DT = rEV_DT;
		PET_YN = pET_YN;
		STAFF_SEQ = sTAFF_SEQ;
		STAFF_NAME = sTAFF_NAME;
		REV_NOTE = rEV_NOTE;
		M_ADDR = m_ADDR;-->
<%
    List<T_RESERVATION> list = (List<T_RESERVATION>) request.getAttribute("list");
%>
<table>
    <tr>
        <th>예약번호</th>
        <th>회원ID</th>
        <th>청소내용</th>
        <th>예약일자</th>
        <th>펫유무</th>
        <th>직원이름</th>
        <th>요청사항</th>
        <th>요청주소</th>
    </tr>
    <%for( T_RESERVATION Rdto :  list){   %>
        <tr>
            <td><%=Rdto.getREV_SEQ() %></td>
            <td><%=Rdto.getM_ID() %></td>
            <td><%=Rdto.getJOB_T() %></td>
            <td><%=Rdto.getREV_DT() %></td>
            <td><%=Rdto.getPET_YN() %></td>
            <td><%=Rdto.getSTAFF_NAME() %></td>
            <td><%=Rdto.getREV_NOTE() %></td>
            <td><%=Rdto.getM_ADDR() %></td>
        </tr>
    <% } %>
</table>

</body>
</html>

