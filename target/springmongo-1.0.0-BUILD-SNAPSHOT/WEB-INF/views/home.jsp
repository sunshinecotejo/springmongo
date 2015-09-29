<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
</head>
<body>
<h1>Home page</h1>  
<p>  
${message}<br>  
<a href="${pageContext.request.contextPath}/books/add.jsp">Add new book</a><br>  
<a href="${pageContext.request.contextPath}/books">Book list</a><br>  
</p> 
  <P>  The time on the server is ${serverTime}. </P> 
</body>
</html>
