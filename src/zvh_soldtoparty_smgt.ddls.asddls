@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help - Sold To Party'
@ObjectModel.usageType: {
    sizeCategory: #S,
    serviceQuality: #A,
    dataClass: #MIXED
}
@ObjectModel.dataCategory: #VALUE_HELP
define view entity zvh_soldtoparty_smgt
  as select from I_BusinessPartner
{
  key BusinessPartner,
      @EndUserText.label: 'Sold-To Party Name'
      SearchTerm1
}
