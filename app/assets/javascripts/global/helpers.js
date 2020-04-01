__App = {};

__App._Helpers = {
  appendContent: (_container, _content) => {
    if(_container) {
        _container.html(_content);
    }

  },

  showMessage: function(data) {
    $container = $('.notification_container')
    $container.addClass(data.messageClass);
    $container.addClass('show');
    $container.html(data.message);

    setTimeout(() => {
      closeMessage($container)
    }, 5000);
  },
  removeModal: (_modal) => {
    if (_modal) {
        _modal.removeClass("in")
            .off('click.dismiss.bs.modal')
            .off('mouseup.dismiss.bs.modal')
            .trigger('hidden.bs.modal');
        $(".modal-backdrop").remove();
        $('body').removeClass('modal-open');
        $('body').css('padding-right', '');
        _modal.hide();
    }
  },

  closeMessage: function ($target) {
    $target.removeClass('show isa_error isa_warning isa_success');
  }
}
