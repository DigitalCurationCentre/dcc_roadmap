import { isObject, isString } from '../../utils/isType';
import { renderNotice, renderAlert } from '../../utils/notificationHelper';
import { scrollTo } from '../../utils/scrollTo';

$(() => {
    $(document).ready(function() {
        $('#questionIdentifiersListModal').on('hidden.bs.modal', function () {
          alert('I am here');
        });
      });
});
