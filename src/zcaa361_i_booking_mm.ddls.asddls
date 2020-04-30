@AbapCatalog.sqlViewName: 'ZCAA361IBKMM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Booking'
define view ZCAA361_I_BOOKING_MM
  as select from zcaa361_book_mm
  association        to parent ZCAA361_I_TRAVEL_MM as _Travel     on  $projection.travel_id = _Travel.travel_id
  association [1..1] to /DMO/I_Customer            as _Customer   on  $projection.customer_id = _Customer.CustomerID
  association [1..1] to /DMO/I_Carrier             as _Carrier    on  $projection.carrier_id = _Carrier.AirlineID
  association [1..1] to /DMO/I_Connection          as _Connection on  $projection.carrier_id    = _Connection.AirlineID
                                                                  and $projection.connection_id = _Connection.ConnectionID

{
      //zcaa361_book_mm
  key travel_id,
  key booking_id,
      booking_date,
      customer_id,
      carrier_id,
      connection_id,
      flight_date,
      @Semantics.amount.currencyCode: 'currency_code'
      flight_price,
      @Semantics.currencyCode: true
      currency_code,
      @UI.hidden: true
      _Travel.last_changed_at ,
      
      /* Associations */
      _Travel,
      _Customer,
      _Carrier,
      _Connection
}
