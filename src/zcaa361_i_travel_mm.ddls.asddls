@AbapCatalog.sqlViewName: 'ZCAA361ITRAMM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Travel'
define root view ZCAA361_I_TRAVEL_MM
  as select from zcaa361_tra_mm

  composition [0..*] of ZCAA361_I_BOOKING_MM as _Booking  
  association [0..1] to /DMO/I_Agency        as _Agency   on $projection.agency_id = _Agency.AgencyID
  association [0..1] to /DMO/I_Customer      as _Customer on $projection.customer_id = _Customer.CustomerID
  association [0..1] to I_Currency           as _Currency on $projection.currency_code = _Currency.Currency

{
      //ZCAA361_TRA_MM
  key travel_id,
      agency_id,
      customer_id,
      begin_date,
      end_date,
      @Semantics.amount.currencyCode: 'currency_code'
      booking_fee,
      @Semantics.amount.currencyCode: 'currency_code'
      total_price,
      @Semantics.currencyCode: true
      currency_code,
      description,
      status,
      @Semantics.user.createdBy: true
      created_by,
      @Semantics.systemDateTime.createdAt: true
      created_at,
      @Semantics.user.lastChangedBy: true
      last_changed_by,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at,


      _Booking,
      _Agency,
      _Customer,
      _Currency
}
