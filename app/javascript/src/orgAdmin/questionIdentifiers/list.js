$(document).ready(function() {
   
    // This is the code to open the modal dialog 
    $('body').on('click','#link_to_question_identifiers_list', (e) =>  {
        var objectId = $(e.target).data('template-id');
       
       
        $.ajax({
          url: "/org_admin/question_identifiers/"+objectId+"/list", 
          success: function(data) {  
            $('#questionIdentifiersListModal .modal-body').html(data.html);
            $('#questionIdentifiersListModal').show();

          }
          
        });

    });

    


    // PDF export question identifiers list 
    // $('#export_pdf_list_link').click(function() {
    //     // Get the actual URL of the export action (adjust the path if needed)
    //     var exportUrl = '<%= url_for(action: :export_pdf_list) %>';

    //     // Use jQuery.ajax to initiate the request
    //     $.ajax({
    //         url: exportUrl,
    //         method: 'GET', // Adjust method if needed (e.g., POST)
    //         success: function(response) {
    //             // Handle successful response (e.g., display confirmation message)
    //             console.log('PDF question identifiers list exported successfully!');
    //         },
    //         error: function(error) {
    //             // Handle errors (e.g., display error message or log for debugging)
    //             console.error('Error exporting question identifiers list:', error);
    //         }
    //     });
    // });

});
