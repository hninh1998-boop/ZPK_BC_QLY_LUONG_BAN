@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help - Ship To Party'
@ObjectModel.usageType: {
    sizeCategory: #S,
    serviceQuality: #A,
    dataClass: #MIXED
}
@ObjectModel.dataCategory: #VALUE_HELP
define view entity zvh_shiptoparty_smgt
  as select from I_BusinessPartner
{
  key BusinessPartner,
      @EndUserText.label: 'Ship-To Party Name'
      case
        when OrganizationBPName1 is not initial
        then OrganizationBPName1
        else LastName
        end as shipToPartyName
}
