__App = {};

__App._Helpers = {
  appendContent: function(_container, _content) {
    if(_container) {
        _container.html(_content);
    }
  },

  removeModal: function(_modal) {
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
}
