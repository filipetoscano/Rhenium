
( function () {

    Vue.filter( 'toDecimal', function ( value, precision ) {
        if ( value == null || value === "" ) {
            return null;
        }

        if ( precision == null ) {
            precision = 2;
        }

        return accounting.formatNumber( value, precision, Rhenium.Number.Thousand, Rhenium.Number.Decimal );
    } );

} )();

/* eof */