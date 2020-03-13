__App = {};

__App._Helpers = {
	getAppendModal: function ( path ) {
		return $.ajax( {
			url: path,
			method: "GET",
			dataType: "json"
		} );
	},
	removeModal: function () {
		$( '[data-item="full-overlay"]' ).empty();
		$( '[data-item="full-overlay"]' ).removeClass( 'overlay--active' );
	},
	appendModal: function ( data ) {
		$( '[data-item="full-overlay"]' ).addClass( 'overlay--active' );
		$( '[data-item="full-overlay"]' ).html( data.html_content );
	}
};