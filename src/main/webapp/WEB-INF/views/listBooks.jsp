<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.9/css/dataTables.bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bookstyle.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js">
	</script>
<script src="https://cdn.datatables.net/1.10.9/js/dataTables.bootstrap.min.js"></script>
 <link rel="stylesheet" 
 	href="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.min.css"/>
 <script type="text/javascript" 
 	src="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"> </script>
</head>
<body>
	<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Book Listing</a>
    </div>
    <div>
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
 
      </ul>
    </div>
  </div>
</nav>
	
	<form class="bs-example bs-example-form"
		data-example-id="input-group-with-button">
		<div class="row">
			<div class="col-lg-3">
				<button type="button" class="btn btn-success" id="addButton"
					data-toggle="modal" onclick="addBook()">
					<span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>Add
					Book
				</button>
				<button type="button" class="btn btn-primary" id="viewButton">
					<span class="glyphicon glyphicon-list" aria-hidden="true"></span>View Books
				</button>
			</div>
			<!-- /.col-lg-3 -->
			<div class="col-lg-3"></div>
			<!-- /.col-lg-3 -->
			<div class="col-lg-3"></div>
			<!-- /.col-lg-3 -->
			<div class="col-lg-3">
			
			</div>
			<!-- /.col-lg-3 -->
		</div>
	</form>
	<%@ include file="bookForm.jsp"%>
	<div id="bookResponse">
			${message}
	</div>
	<table id="example" class="table table-striped table-bordered"
		cellspacing="0" width="100%">
		<thead>
			<tr>
				<th>Title</th>
				<th>Author</th>
				<th>ISBN</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${!empty books}">
			<c:forEach var="book" items="${books}" varStatus="loop">
				<tr>
					<td>${book.title}</td>
					<td>${book.author}</td>
					<td>${book.isbn}</td>
					<td>
					<button type="button"
						onclick="editBook('${book._id}');"
						class="btn btn-success" >
						<span class="glyphicon glyphicon-edit"
							aria-hidden="true">
						</span>
						Edit
					</button>
					<a href="${pageContext.request.contextPath}/books/delete/${book._id}"
						type="button" class="btn btn-danger"><span
							class="glyphicon glyphicon-remove" aria-hidden="true"></span>Delete</a>
					</td>
				</tr>
			</c:forEach>
		</c:if>
		</tbody>
	</table>

	

	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/response.js"></script> 
    <script type="text/javascript">
		function addBook(){
			 $(".modal-title").text("Add Book");
			 $("#title").val("");
	         $("#author").val("");
	         $("#isbn").val("");
	         $("#id").val("");
			 $('#bookModal').modal('show'); 
			 
		}
		
		function editBook(id){

			$.ajax({
		        url: "${pageContext.request.contextPath}/books/read/"+id,
		        type: 'GET',
		        dataType: 'json', 
		        success: function(book) {
		         
		            $(".modal-title").text("Edit Book");
		            $("#title").val(book.title);
		            $("#author").val(book.author);
		            $("#isbn").val(book.isbn);
		            $("#id").val(book._id);
					$('#bookModal').modal('show'); 
		        }
		    });
		}
    </script>
</body>
</html>