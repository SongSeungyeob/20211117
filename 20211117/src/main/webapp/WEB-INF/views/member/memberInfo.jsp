<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="js/jquery-3.6.0.min.js"></script>
		<script type="text/javascript">
			$(function() {
				$("#btn1").click(function() {
					frm.action = "memberUpdate.do";
					frm.submit();
				});
				
				$("#btn2").click(function() {
					var str = confirm("회원탈퇴 진짜 할거야 ??ㅠㅠㅠㅠ\n 한번 더 기회드림 !!");
					if(str) {
						frm.action = "memberDelete.do";
					} else {
						return false;
					}
					frm.submit();
					
				});
			});
		</script>
	</head>
		
	<body>
		<jsp:include page="../home/header.jsp"/>
		<div align="center">
			<div>
				<h1>나의(${member.name} 님) 정보입니다.</h1>
			</div>
			<div>
				<table border="1">
					<tr>
						<th width="150">I D</th>
						<td width="150">${member.id }</td>
						<th width="150">NAME</th>
						<td width="150">${member.name }</td>
					</tr>
					<tr>
						<th>PASSWORD</th>
						<td>********</td>
						<th>AUTHOR</th>
						<td>${member.author}</td>
					</tr>
					<tr>
						<th>TELEPHONE</th>
						<td colspan="3">${member.tel }</td>
						
					</tr>
					<tr>
						<th>ADDRESS</th>
						<td colspan="3">${member.address }</td>
					</tr>
				</table>
			</div><br>
			<div>
				<button type="button" id="btn1">수 정</button>&nbsp;&nbsp;&nbsp;
				<button type="button" id="btn2">탈 퇴</button>
			</div>
			<div>
				<form id="frm" method="post">
					<input type="hidden" id="id" name="id" value="${member.id }">
				</form>
			</div>
		</div>
	</body>
</html>