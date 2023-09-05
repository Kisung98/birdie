<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>랭킹확인</title>
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

#wrapper {
	height: 100%;
}

footer {
	position: relative;
	transform: translateY(-100%);
}
</style>






<%
List<Map<String, Object>> rankinglist = (List<Map<String, Object>>) request.getAttribute("rankinglist");
%>


</head>







<body>

	<%@include file="/include/header.jsp"%>
	<div id='wrapper'>
		<div>
			<br> <br> <br>
			<h1>랭킹확인</h1>


			<input type="button" value="새로고침" class="rounded-submit" onclick="location.href='/birdie/rankingList.ranking';">
			<hr>


			<table>
				<tr>
					<th style="width: 20%">랭킹등수</th>
					<th>점수</th>
					<th>아이디</th>
				</tr>
				<%
				if (rankinglist != null)
				{
					for (Map<String, Object> rmap : rankinglist)
					{
				%>
				<tr>
					<!-- r.RES_NO , r.RES_DATE , m.MEM_NO , m.MEM_ID -->
					<td>
						<%=rmap.get("ROWNUM")%>
					</td>

					<td>
						<%=rmap.get("MEM_SCORE")%>
					</td>

					<td>
						<%=rmap.get("MEM_ID")%>
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
		</div>
	</div>
	<%-- <footer><%@include file="/include/bottom.jsp"%></footer> --%>
</body>

</html>