// if the ajax request from form or link was successful, then replace html content
$(document).on('ajax:success', '.dynamic-form', function(e, data) {
  const $target = $(e.target);
  const $modal = $target.closest('.modal');
  const $targetContainer = $(`#${$target.data('container')}`);
  __App._Helpers.removeModal($modal);

  appendContent($targetContainer, data.html_content)
});

// show the message when the the ajax request returned success
$(document).on('ajax:success', '.notification-messages', function(e, data) {
  showMessage(data)
});

// show the message when the the ajax request returned failure
$(document).on('ajax:error', '.notification-messages', function(e, xhr, set, error) {
  showMessage(xhr.responseJSON);
})

// close the notification container when the user clicks on it
$(document).on('click', '.notification_container', function(event) {
  closeMessage($(this));
})

function appendContent(_container, _content) {
  if(_container) {
      _container.html(_content);
  }
}

function showMessage(_data) {
  const $container = $('.notification_container')
  $container.addClass(_data.messageClass);
  $container.addClass('show');
  $container.html(_data.message);
}

function closeMessage(_target) {
  _target.removeClass('show isa_error isa_warning isa_success');
}
