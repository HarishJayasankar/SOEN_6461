<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@	page import="java.util.*, java.text.*"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%@ include file="header.jsp" %>  
	<p color="red">${message }</p>
	<form action="${contextPath}/client/viewDetails" method="get">
		<table width="800" border="1">
			<tr>
				<td height="40" colspan="2"><font size="5 "> First Name
						: </font></td>
				<td><input type="text" name="firstName" required="required"
					value="${client.firstName }"></td>
			</tr>
			<tr>
				<td height="40" colspan="2"><font size="5 "> Last Name :
				</font></td>
				<td><input type="text" name="lastName" required="required"
					value="${client.lastName }"></td>
			</tr>
			<tr>
				<td height="40" colspan="2"><font size="5 "> License
						Number : </font></td>
				<td><input type="text" name="licenseNumber" readonly="readonly"
					pattern="[A-Z]{1}-[0-9]{4}-[0-9]{6}-[0-9]{2}" value=${client.licenseNumber}
					, placeholder="A-1234-123456-12"></td>
			</tr>
			<tr>
				<td height="40" colspan="2"><font size="5 "> Expiration
						Date : </font></td>
				<%
					Date date = new Date();
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				%>
				<td><input type="date" id="expDate" name="expDate" required="required" value=${client.licenseExpiryDate }
					min="<%format.format(date); %>"></td>
			</tr>
			<tr>
				<td height="40" colspan="2"><font size="5 "> Phone
						Number</font></td>
				<td><input type="number" name="phone" required="required" value=${client.phoneNo }></td>
			</tr>
		</table>
		<a href="${contextPath}/client/dashboard">Back</a>
		<a href="${contextPath}/client/deleteClient?licenseNumber=${client.licenseNumber}">Delete</a> 
		<input type="submit" value="Update Record">
	</form>
	<script type="text/javascript">
	var date = new Date();
	var d = (1900 + date.getYear()) + "-" + (1 + date.getMonth()) + "-"
			+ (date.getDate() < 10 ? '0' + date.getDate() : date.getDate());
	document.getElementById('expDate').setAttribute('min', d);
	</script>
</body>
</html>