$(document).ready(function(){
	
	  $('#bookForm')
      .bootstrapValidator({
      excluded: ':disabled',
      feedbackIcons: {
          valid: 'glyphicon glyphicon-ok',
          invalid: 'glyphicon glyphicon-remove',
          validating: 'glyphicon glyphicon-refresh'
      },
      fields: {
          title: {
              validators: {
                  notEmpty: {
                      message: 'The title is required'
                  }
              }
          },
          author: {
              validators: {
                  notEmpty: {
                      message: 'The author is required'
                  }
              }
          },
          isbn: {
              validators: {
                  notEmpty: {
                      message: 'The ISBN is required'
                  }
              }
          }
      }
  })
      .on('success.form.bv', function (e) {
      // Prevent form submission
      e.preventDefault();
      submitOnClick();
      $('#bookModal').modal('hide');
  });

  $('#bookModal')
     .on('shown.bs.modal', function () {
         $('#bookForm').find('[name="title"]').focus();
      })
      .on('hidden.bs.modal', function () {
          $('#bookForm').bootstrapValidator('resetForm', true);
      });
	
	$('#example').DataTable( );
 /*
	$('#example').DataTable( {
        "paging":   false,
        "ordering": false,
        "info":     false
    	} );
	*/
	function submitOnClick(){
		
		 var title = $("#title").val();
		 var author = $("#author").val();
		 var isbn = $("#isbn"). val();
		 var id = $("#id").val();

		 
		if($(".modal-title").text()=="Add Book"){
			addBookService(title, author, isbn);          
		}else if($(".modal-title").text()=="Edit Book"){
			updateBookService(id, title, author, isbn);
		}

		event.preventDefault();
	}
	
	function addBookService(title, author, isbn){
		 var arr = {
				 "title": title,
				 "author": author,
				 "isbn":isbn
				 };
	
		 $.ajax({
            url: 'http://localhost:8080/springmongo/books/create',
            data: JSON.stringify(arr),
            type: 'POST',
            beforeSend: function(xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-Type", "application/json");
            },
            success: function(book){  
           
           	 var message = "";
                message = "Book  was added successfully : [";
                message += book.title +" : ";
                message += book.author + " : ";
                message += book.isbn + " ]";
                  
             	$("#bookResponse").text(message);
   	
            }
        });
	}
	
	function updateBookService(id, title, author, isbn){
		 var arr = {
				 "_id" : id,
				 "title": title,
				 "author": author,
				 "isbn":isbn
				 };
		 
		 $.ajax({
            url: 'http://localhost:8080/springmongo/books/update',
            data: JSON.stringify(arr),
            type: 'PUT',
            beforeSend: function(xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-Type", "application/json");
            },
            success: function(book){  
           	 
           	 var message = "";
                message = "Book  was updated successfully : [";
                message += book.title +" : ";
                message += book.author + " : ";
                message += book.isbn + " ] ";
                  
             	$("#bookResponse").text(message);
   	
            }
        });
		  
	}
	
	$("#viewButton").click(function(){
		location.reload();
	});
});