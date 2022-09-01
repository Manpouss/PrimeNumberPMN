<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="md" uri="/WEB-INF/primeNumber2.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h3>Question 1 : nombres premiers de 2 à 30</h3>
	<c:forEach var="i" begin="2" end="30">
		<c:if test="${md:primeNameforCallInJSP(i)}">
			<span style="color : green"><c:out value="${i} est un nombre premier" /></span>
		</c:if>
		<c:if test="${!md:primeNameforCallInJSP(i)}">
			<span style="color : red"><c:out value="${i} n'est pas un nombre premier" /></span>
		</c:if>
		<br>
	</c:forEach>
	
	<h3>Question 2 : Nombre donn� en param�re</h3>
	<form method="post">
		<label>Nombre choisi : </label><input name="number" type="number" required>
		<input type="submit" value="Envoyer">
	</form>
	<c:if test="${not empty param.number}">
		<c:if test="${md:primeNameforCallInJSP(param.number)}">
			<span class="blue"><c:out value="${param.number} est un nombre premier" /></span>
		</c:if>
		<c:if test="${!md:primeNameforCallInJSP(param.number)}">
			<span class="red"><c:out value="${param.number} n'est pas un nombre premier" /></span>
		</c:if>
	</c:if>
	
	<h3>Question 3 : 2 nombres donn�es en param�tres pour calculer la liste</h3>
	<form method="post">
		<label>Nombre un : </label><input pattern="[0-9]+$" name="number1" type="number" required>
		<label>Nombre deux : </label><input pattern="[0-9]+$" name="number2" type="number" required>
		<input type="submit" value="Envoyer">
	</form>
	<c:if test="${not empty param.number1 and not empty param.number2}">
		<c:choose>
			<c:when test="${param.number1 > param.number2}">
				<c:set var="max" value="${param.number1}" />
				<c:set var="min" value="${param.number2}" />
			</c:when>
			<c:otherwise>
				<c:set var="max" value="${param.number2}" />
				<c:set var="min" value="${param.number1}" />
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${min}" end="${max}">
			<c:if test="${md:primeNameforCallInJSP(i)}">
				<span class="blue"><c:out value="${i} est un nombre premier" /></span>
			</c:if>
			<br>
		</c:forEach>
	</c:if>
</body>
</html>