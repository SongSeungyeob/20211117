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
				if($("#password").val() != $("#passwordchk").val()) {
					alert("비밀번호를 확인해 주세요 !!");
					$("#password").focus();
					return false;
				} else {
					frm.action = "memberEditSave.do";
					frm.submit();
				}
			});
			
			$("#btn2").click(function() {			
				frm.action = "memberDelete.do";
				frm.submit();
			});
		});
		</script>
	</head>
	
	<body>
	<jsp:include page="../home/header.jsp"/>
	<div align="center">
			<div><h1>나의(${member.name} 님) 정보입니다.</h1></div>
			<div>
				<form id="frm" method="post">
				<div>
					<table border="1">
						<tr>
							<th width="150">I D</th>
							<td width="150">${member.id }</td>
							<th width="150">NAME</th>
							<td width="150">
								<input type="text" id="name" name="name" value="${member.name }">
							</td>
						</tr>
						<tr>
							<th>PASSWORD</th>
							<td>
								<input type="password" id="password" name="password" value="${member.password }">
							</td>
							<th>PASSWORD CHECK</th>
							<td>
								<input type="password" id="passwordchk" name="passwordchk" value="${member.password }">
							</td>
						</tr>
						<tr>
							<th>TELEPHONE</th>
							<td>
								<input type="text" id="tel" name="tel" value="${member.tel }">
							</td>
							<th>AUTHOR</th>
							<td>${member.author}</td>
						</tr>
						<tr>
							<th>ADDRESS</th>
							<td colspan="3">
								<input type="text" id="address" name="address" size="70" value="${member.address }">
							</td>
						</tr>
					</table>
				</div><br>
				<div>
					<button type="button" id="btn1">저 장</button>&nbsp;&nbsp;&nbsp;
					<button type="button" id="btn2">취 소</button>
				</div>
				<div>
					<input type="hidden" id="id" name="id" value="${member.id }">
					<input type="hidden" id="author" name="author" value="${member.author }">
				</div>
				</form>
			</div>
		</div>
	</body>
</html>