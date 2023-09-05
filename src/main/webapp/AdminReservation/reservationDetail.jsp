<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보가</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../css/noticeMake.css">

<%
Map<String,Object> rmap = (Map<String,Object>)request.getAttribute("reservation");
%>

<style>
table {
	width: 40%;
	border-collapse: collapse;
	border-radius: 8px;
	overflow: hidden;
	box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.1);
	margin-left: auto;
	margin-right: auto;
}

th, td {
	padding: 12px;
	text-align: left;
	background-color: #f7f7f7;
	color: #333;
}

th {
	font-weight: bold;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #ffeb3b;
}

textarea {
	height: 200px;
}

input {
	border-radius: 5px;
}
</style>



</head>

<body>

	<%@include file="/include/header.jsp"%>

	<br>
	<br>
	<br>
	<h1>예약확인 상세보기</h1>



	<table>

		<tr>
			<th>예약번호</th>
			<th><%=rmap.get("RES_NO")%>  </th>
		</tr>

		<tr>
			<th>예약날짜</th>
			<th><%=rmap.get("RES_DATE")%>  </th>
		</tr>
		
		<tr>
			<th>결제금액</th>
			<th><%=rmap.get("PAY_AMOUNT")%>  </th>
		</tr>
		
		<tr>
			<th>인원수</th>
			<th><%=rmap.get("RES_PTOTAL")%>  </th>
		</tr>
		
		<tr>
			<th>방번호</th>
			<th><%=rmap.get("RES_ROOMNO")%>  </th>
		</tr>
		
		<tr>
			<th>예약시간</th>
			<th><%=rmap.get("RES_TIME")%>  </th>
		</tr>
		
		<tr>
			<th>회원번호</th>
			<th><%=rmap.get("MEM_NO")%>  </th>
		</tr>
		
		<tr>
			<th>회원아이디</th>
			<th><%=rmap.get("MEM_ID")%>  </th>
		</tr>
		
		<tr>
			<th>회원이름</th>
			<th><%=rmap.get("MEM_NAME")%>  </th>
		</tr>

	</table>
	<hr>
	<div style="margin-left: 1500px;">
		<input type="button" class="btn btn-outline-success" value="글목록" onclick="location.href='/birdie/reservationList.reservation'">
		<input type="button" class="btn btn-outline-success" value="글삭제" onclick="location.href='/birdie/reservationDelete.reservation?res_no=<%=rmap.get("RES_NO")%>'">
		<%-- <input type="button" class="btn btn-outline-success" value="글수정" onclick="location.href='/birdie/reservationDelete.reservation?res_no=<%=rmap.get("RES_NO")%>'"> --%>
	</div>



</body>

</html>