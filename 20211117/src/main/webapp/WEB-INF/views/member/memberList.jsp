<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	function authorEdit(str) {
		var id = str;
		console.log(id);
		var author = ($('.' + id + '> option:selected').val());
		console.log(author);
		/*$.ajax({
			url : 'ajaxMyUpdateAuthor.do',
			type : 'post',
			data : { 
					updateId : id,
					updateAuthor : 
				},
			
		});*/
	}
</script>

</head>
<body>
<jsp:include page="../home/header.jsp"></jsp:include>
	<div align="center">
		<div>
			<h1>멤버목록</h1>
		</div>
		<div>
			<table border="1">
				<tr>
					<th width="150">아이디</th>
					<th width="150">이름</th>
					<th width="150">전화번호</th>
					<th width="400">주소</th>
					<th width="100">권한</th>
					<th width="100">권한수정</th>
				</tr>
				<c:forEach items="${members }" var="member"> <!-- items = 객체를 읽어오겠다는 것. -->
					<tr onmouseover="this.style.background='#fcecae';"
					    onmouseleave="this.style.background='#ffffff';">
					    <td align="center">${member.id }</td>
					    <td align="center">${member.name }</td>
					    <td align="center">${member.tel }</td>
					    <td>&nbsp;${member.address }</td>
					    <td align="center">
					    	<select id="author" class=${member.id } name="author">
					    		<c:if test="${member.author eq 'ADMIN'}">
						    		<option value="ADMIN" selected="selected">ADMIN</option>
						    		<option value="USER">USER</option>
					    		</c:if>
					    		<c:if test="${member.author eq 'USER' }">
					    			<option value="ADMIN">ADMIN</option>
						    		<option value="USER" selected="selected">USER</option>
					    		</c:if>
					    	</select>
						</td>
					    <td align="center"><button type="button" onclick="authorEdit('${member.id }')">변경</button></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div><br>
		<input type="button" value="홈으로" onclick="location.href='home.do'">
		</div>
	</div>
</body>
</html>