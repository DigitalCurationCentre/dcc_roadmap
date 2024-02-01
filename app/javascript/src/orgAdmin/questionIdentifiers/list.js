import { isObject, isString } from '../../utils/isType';
import { renderNotice, renderAlert } from '../../utils/notificationHelper';
import { scrollTo } from '../../utils/scrollTo';
$(document).ready(function() {
   
    // $('#questionIdentifiersListModal').remove(); // Remove any existing modal with the same ID
    $('body').append(response.html); 
    alert ("1 alert");
    $('body').on('click','#link_to_question_identifiers_list', (e) => {
        $('#questionIdentifiersListModal').modal('show');
        
        $('#questionIdentifiersListModal').on('ajax:success', function(event, data, status, xhr) {
        if (data.success) {
            $('#questionIdentifiersListBody').html(data.html); // Update modal content with rendered partial
            alert(data.message);
        } else {
            // Handle errors
        }
        });
    });    
});


// $(() => {
//     alert("1 here");
//     $('body').on('click','#link_to_question_identifiers_list', (e) => {
//        alert("2 here");
//        $(document).ready(function() {
//             $('#questionIdentifiersListModal').on('show.bs.modal', function () {
//                 alert("3 here");
//              });        
//         });
//     });
// });
