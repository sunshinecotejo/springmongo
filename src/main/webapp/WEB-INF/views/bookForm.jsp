
<!-- Modal -->
<div class="modal fade" id="bookModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title"></h4>
			</div>
			<div class="modal-body">
				<form id="bookForm" method="post" class="form-horizontal">
					<div class="form-group">
						<label for="title" class="col-xs-4 control-label" >Title:</label> 
						<div class="col-xs-5">
							<input type="text" class="form-control" id="title" name="title">
						</div>
					</div>
					<div class="form-group">
						<label for="author"class="col-xs-4 control-label" >Author:</label> 
						<div class="col-xs-5">
							<input type="text"	class="form-control" id="author" name="author">
						</div>
					</div>
					<div class="form-group">
						<label for="isbn" class="col-xs-4 control-label">ISBN:</label> 
						<div class="col-xs-5">
							<input type="text" class="form-control" id="isbn" name="isbn">
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-5">
							<input type="hidden" class="form-control" id="id">
						</div>
					</div>
					<div class="form-group">
			        	<div class="col-xs-5 col-xs-offset-5">	
							<button type="submit" class="btn btn-primary"
								id="saveButton">Save</button>
						</div>
				</div>
				</form>
			</div>  <!-- end modal-body -->
		</div> <!-- end modal-content -->

	</div> <!-- end modal-body -->
</div>
<!-- end modal -->