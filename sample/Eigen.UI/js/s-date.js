
( function () {

    Vue.filter( 'toDate', function ( value ) {
        if ( value == null ) {
            return null;
        }

        var m = moment( value, 'YYYY-MM-DD', true );

        if ( m.isValid() == false ) {
            return null;
        }

        // todo
        return m.format( 'DD-MM-YYYY' );
    } );


    Vue.filter( 'toDateTime', function ( value ) {
        if ( value == null ) {
            return null;
        }

        var m = moment( value, 'YYYY-MM-DDTHH:mm:ssZ', true );

        if ( m.isValid() == false ) {
            return null;
        }

        // todo
        return m.format( 'DD-MM-YYYY HH:mm:ss' );
    } );


    Vue.filter( 'toTime', function ( value ) {
        if ( value == null ) {
            return null;
        }

        var m = moment( value, 'HH:mm', true );

        if ( m.isValid() == false ) {
            return null;
        }

        // todo
        return m.format( 'HH:mm' );
    } );

} )();

/* eof */