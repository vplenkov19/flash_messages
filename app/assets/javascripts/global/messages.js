$(document).on('ajax:success', '.dynamic-form', function(e, data) {
  $target = $(e.target);
  const $modal = $target.closest('.modal');
  __App._Helpers.removeModal($modal);

  const $targetContainer = $(`#${$target.attr('data-container')}`);

  __App._Helpers.appendContent($targetContainer, data.html_content)
});

$(document).on('ajax:success', '.notification-messages', function(e, data) {
  __App._Helpers.showMessage(data)
});

$(document).on('ajax:error', '.notification-messages', function(e, xhr, set, error) {
  __App._Helpers.showMessage(xhr.responseJSON);
})

$(document).on('click', '.notification_container', function(event) {
  __App._Helpers.closeMessage($(this));
})
