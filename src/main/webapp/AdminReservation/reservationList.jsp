<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약관리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
table {
	width: 90%;
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
	background-color: #B6CFB6;
	font-weight: bold;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #ffeb3b;
}

.rounded-input {
	border: none;
	border-radius: 20px;
	padding: 10px 15px;
	font-size: 16px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

.rounded-submit {
	background-color: #ff4081;
	color: #fff;
	border: none;
	border-radius: 20px;
	padding: 10px 20px;
	font-size: 16px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
	cursor: pointer;
}

.rounded-submit:hover {
	background-color: #e6005c;
}
</style>



<%
List<Map<String, Object>> rlist = (List<Map<String, Object>>) request.getAttribute("rlist");
%>


</head>

<body>

	<%@include file="/include/header.jsp"%>

	<br>
	<br>
	<br>
	<h1>예약관리</h1>

	<form action="/birdie/reservationListSearch.reservation" style="display: inline;">
		<input type="text" class="rounded-input" placeholder="이름입력" name="mem_name">
		<input type="submit"  value="검색" class="rounded-submit">
	</form>

	<input type="button" value="전체조회" class="rounded-submit" onclick="location.href='/birdie/reservationList.reservation';">
	<hr>


	<table>
		<tr>
			<th>예약번호</th>
			<th>예약날짜</th>
			<th>결제금액</th>
			<th>총인원수</th>
			<th>방번호</th>
			<th>이용시간</th>
			<th>회원번호</th>
			<th>회원아이디</th>
			<th>회원이름</th>
		</tr>
		<%
		if (rlist != null)
		{
			for (Map<String, Object> rmap : rlist)
			{
		%>

		<!-- 	SELECT
		r.RES_NO ,
		r.RES_DATE ,
		r.pay_amount,
		r.res_ptotal,
		r.RES_ROOMNO,
		r.res_time,
		m.MEM_NO ,
		m.MEM_ID,
		m.mem_name
		FROM
		RESERVATION r
		INNER JOIN
		MEMBER m ON
		r.MEM_NO =
		m.MEM_NO order by r.RES_NO; -->
		<tr>
			<td>
				<a href="/birdie/reservationDetail.reservation?res_no=<%=rmap.get("RES_NO")%>" style="text-decoration: underline;">
					<%=rmap.get("RES_NO")%></a>
			</td>

			<td>
				<%=rmap.get("RES_DATE")%>
			</td>

			<td>
				<%=rmap.get("PAY_AMOUNT")%>
			</td>

			<td>
				<%=rmap.get("RES_PTOTAL")%>
			</td>

			<td>
				<%=rmap.get("RES_ROOMNO")%>
			</td>

			<td>
				<%=rmap.get("RES_TIME")%>
			</td>

			<td>
				<%=rmap.get("MEM_NO")%>
			</td>

			<td>
				<%=rmap.get("MEM_ID")%>
			</td>

			<td>
				<%=rmap.get("MEM_NAME")%>
			</td>
		</tr>
		<%
		} //end of for
		} //end of if
		else
		{
		%>
		<tr>
			<td colspan="9">조회결과가 없습니다.</td>
		</tr>
		<%
		}
		%>
	</table>

</body>

</html>