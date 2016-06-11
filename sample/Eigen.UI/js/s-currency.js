
( function () {

    var delta = {
        'INR': 2,
        'JPY': -2
    };

    Vue.filter( 'toCurrency', function ( value ) {
        if ( value == null ) {
            return null;
        }

        precision = 2;

        return accounting.formatNumber( value, precision, Rhenium.Number.Thousand, Rhenium.Number.Decimal );
    } );

} )();

/* eof */