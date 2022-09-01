<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix ="md" uri ="/WEB-INF/tld/primeNumber.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Prime Number</title>
	</head>
	<body>
		<h1>Partie 1</h1>
		<c:forEach items="${primeList}" var="prime">
			<c:out value="${prime} est un nombre premier"/><br>
		</c:forEach>
		

		<h1>Partie 2</h1>
		
		<form name="primeForm" id="prime_form" method="post">
			<input type="text" name="testedNumber" placeholder="Entrez un nombre">
			<input type="submit" name="bsubmitT" value="nombre">
		</form>
		<c:if test="${isPrime == true}">
			<c:out value="${testedNumber} est un nombre premier"/><br>
		</c:if>
		<c:if test="${isPrime == false && testedNumber !=null && message_errort == false}">
			<c:out value="${testedNumber} n'est pas un nombre premier"/><br>
		</c:if>
		<c:if test="${message_errort == true}">
			<c:out value="Les données sont erronées "/><br>
			<c:out value="Le champ doit être un nombre"/><br>
		</c:if>
		
		<h1>Partie 3</h1>
		
		<form name="primeForm2" id="prime_form2" method="post">
			<input type="text" name="firstNumber" placeholder="Entrez un nombre">
			<input type="text" name="secondNumber" placeholder="Entrez un nombre">
			<input type="submit" name="bsubmitL" value="nombre">
		</form>
		<c:if test="${firstNumber !=null && secondNumber !=null}">
			<h3><c:out value="Nombres premiers entre ${firstNumber} et ${secondNumber}"/><br></h3>
		</c:if>
		<c:forEach items="${primeList2}" var="prime2">
			<c:out value="${prime2} est un nombre premier"/><br>
		</c:forEach>
		<c:if test="${message_error == true}">
			<c:out value="Les données sont erronées "/><br>
			<c:out value="Les champs doivent être des nombres"/><br>
			<c:out value="le premier nombre doit être inférieur au second"/><br>
		</c:if>
	</body>
</html>