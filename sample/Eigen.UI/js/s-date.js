
( function () {

    Vue.filter( 'toDate', function ( value ) {
        if ( value == null ) {
            return null;
        }

        var m = moment( value, 'YYYY-MM-DD', true );

        if ( m.isValid() == false ) {
            return null;
        }

        return m.format( 'DD-MM-YYYY' );
    } );

} )();

/* eof */