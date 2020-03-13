$( document ).on( 'click', '[data-item="full-overlay"]', function ( event ) {
	if ( event.currentTarget === event.target ) {
		__App._Helpers.removeModal();
	}
} );

$( document ).on( 'click', '[data-action="close-modal"]', function () {
	__App._Helpers.removeModal();
} );

$( document ).on( 'keydown', function ( event ) {
	if ( event.keyCode === 27 ) {
		__App._Helpers.removeModal();
	}
} );