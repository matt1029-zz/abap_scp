@EndUserText.label: 'Travel Consumption'
@AccessControl.authorizationCheck: #CHECK
@UI: {
   headerInfo: { typeName: 'Travel',
                 typeNamePlural: 'Travels',
                 title: { type: #STANDARD, value: 'TravelID' },
                 description: { type: #STANDARD, value: 'Description' }
                 },
   presentationVariant: [{ sortOrder: [{ by: 'TravelID', direction: #DESC }] }]
  }
  
@Metadata.allowExtensions: true
define root view entity ZCAA361_C_TRAVEL_MM
  as projection on ZCAA361_I_TRAVEL_MM
{
            //ZCAA361_I_TRAVEL_MM
  key travel_id as TravelID,
      
      @ObjectModel.text.element: ['AgencyName' ]
      agency_id as AgencyID, _Agency.Name as AgencyName,
      
      @ObjectModel.text.element: ['CustomerName']
      customer_id as CustomerID,  _Customer.LastName as CustomerName, 
      
      description as Description,

      begin_date as BeginDate,

      end_date as EndDate,
      
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee as BookingFee,
      
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price as TotalPrice,

      @Semantics.currencyCode: true
      currency_code as CurrencyCode,

      status as TravelStatus,
      
      last_changed_at as LastChangedAt,
      /* Associations */
      //ZCAA361_I_TRAVEL_MM
      _Agency,
      _Booking : redirected to composition child ZCAA361_C_BOOKING_MM,
      _Currency,
      _Customer
}
