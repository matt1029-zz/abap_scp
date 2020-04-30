@EndUserText.label: 'Booking Consumption'
@AccessControl.authorizationCheck: #CHECK

@UI:{
    headerInfo: {
    typeName: 'Booking',
    typeNamePlural: 'Bookings',
    title: {
        type: #STANDARD,
        value: 'BookingID'
        }
    }
}
@Metadata.allowExtensions: true
define view entity ZCAA361_C_BOOKING_MM
  as projection on ZCAA361_I_BOOKING_MM
{


      //ZCAA361_I_BOOKING_MM
  key travel_id     as TravelID,

  key booking_id    as BookingID,

      booking_date  as BookingDate,

      customer_id   as CustomerID,

      carrier_id    as CarrierID,

      connection_id as ConnectionID,

      flight_date   as FlightDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price  as FlightPrice,

      @Semantics.currencyCode: true
      currency_code as CurrencyCode,
      /* Associations */
      //ZCAA361_I_BOOKING_MM
      _Carrier,
      _Connection,
      _Customer,
      _Travel : redirected to parent ZCAA361_C_TRAVEL_MM

}
