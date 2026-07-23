@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help - Bill To Party'
@ObjectModel.usageType: {
    sizeCategory: #S,
    serviceQuality: #A,
    dataClass: #MIXED
}
@ObjectModel.dataCategory: #VALUE_HELP
define view entity zvh_billtoparty_smgt
  as select from I_BusinessPartner
{
  key BusinessPartner,
      @EndUserText.label: 'Bill-To Party Name'
      case
        when OrganizationBPName1 is not initial
        then OrganizationBPName1
        else LastName
        end as BillToPartyName
}
