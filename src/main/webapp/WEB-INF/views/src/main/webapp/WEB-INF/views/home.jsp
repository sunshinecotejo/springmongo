<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>CRUD MongoDB</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<script>
$(document).ready(function () {
	var tempId;
	$("#submit").click(save);
	
	function save(event){
		$.post("save", {
				id : tempId,
				firstName : $('#firstName').val(),
				lastName : $('#lastName').val(),
				age : $('#age').val(),
				department : $('#department').val()
			},
			
			function (employee) {
				$("#row" + tempId).remove();
				var output = "";
				output += "<tr id='row";
				output += employee.id;
				output += "'><td>";
				output += employee.firstName;
				output += "</td><td>";
				output += employee.lastName;
				output += "</td><td>";
				output += employee.age;
				output += "</td><td>"
				output += employee.department;
				output += "</td><td><button id='delete";
				output += employee.id;
				output += "' class='btn btn-primary btn-xs'>";
				output += "Delete";
				output += "</button> <button id='update";
				output += employee.id;
				output += "' class='btn btn-primary btn-xs'>";
				output += "Update";
				output += "</button></td>";
				output += "</tr>";
	
				$("#table").find('tbody').append(output);
			}
		);
	}

	$("#table").on("click", "tr button[id^='delete']", del);

	function del(event){
		var thisId = $(this).attr('id').substring(6);		
		$.post("delete", {
				id : thisId,
				firstName : $('#firstName').val(),
				lastName : $('#lastName').val(),
				age : $('#age').val(),
				department : $('#department').val()
			},		
			function (employee) {
				$("#row" + thisId).remove();	
			}
		);
	}
	
	$("#table").on("click", "tr button[id^='update']", upt);
	
	function upt(event){
		tempId = $(this).attr('id').substring(6);
		$.post("read",{
				id : tempId
			},
			function (employee){
				$('#firstName').val(employee.firstName);
				$('#lastName').val(employee.lastName);
				$('#age').val(employee.age);
				$('#department').val(employee.department);
			}
		);
		$("#addModal").modal({
			show : false
		});
		$("#addModal").modal('show');
	}

	$("#add").click(add);
	
	function add(event){
		tempId = "null";
		
		$('#firstName').val("");
		$('#lastName').val("");
		$('#age').val("");
		$('#department').val("");
		
		$("#addModal").modal({
			show : false
		});
		$("#addModal").modal('show');
	}
});
</script>

</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">CRUD MongoDB</a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="home">Home</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<a href="#" id="add" class="btn btn-primary btn-sm"> <span
			class="glyphicon glyphicon-plus"></span> New Entry
		</a> <br> <br>
		<table id="table" class="table table-bordered">
			<thead>
				<tr>
					<th><strong>First Name</strong></th>
					<th><strong>Last Name</strong></th>
					<th><strong>Age</strong></th>
					<th><strong>Department</strong></th>
					<th><strong>Action</strong></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="employee" items="${listEmployees}">
					<tr id="row${employee.id}">
						<td>${employee.firstName} </td>
						<td>${employee.lastName}</td>
						<td>${employee.age}</td>
						<td>${employee.department}</td>
						<td><button id="delete${employee.id}" class="btn btn-primary btn-xs">Delete</button>
							<button id="update${employee.id}" class="btn btn-primary btn-xs">Update</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="addModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Employee Details</h4>
				</div>
				<div class="modal-body">
					<form role="form">
						<div id="holder"></div>
						<div class="form-group">
						 <input type="text"
								class="form-control" id="firstName" placeholder="First Name">
						</div>
						<div class="form-group">
						 <input type="text"
								class="form-control" id="lastName" placeholder="Last Name">
						</div>

						<div class="form-group">
							<input type="text"
								class="form-control" id="age" placeholder="Age">
						</div>
						<select class="form-control" id="department" >
							<option value='' disabled selected style='display:none;'>Department</option>
						   <option value='HR'>HR</option>
						   <option value='IT'>IT</option>
						   <option value='Dev'>Devs</option>
						   <option value='Staff'>Staff</option>
						</select>			
					</form>
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal" id="submit" >Submit</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>