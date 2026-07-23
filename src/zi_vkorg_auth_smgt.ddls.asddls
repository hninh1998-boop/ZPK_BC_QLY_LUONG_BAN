@AbapCatalog.sqlViewName: 'ZV_VKORG_ASMGT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'zi_vkorg_auth_smgt'
@Metadata.ignorePropagatedAnnotations: true
define view zi_vkorg_auth_smgt
  as select from I_SalesOrganization
{
  key SalesOrganization,
      SalesOrganizationCurrency,
      CompanyCode,
      IntercompanyBillingCustomer,
      ArgentinaDeliveryDateEvent,
      AddressID,
      VATRegnNumberDeterminationRule,
      /* Associations */
      _Address,
      _CompanyCode,
      _DfltAddrRprstn,
      _IntercompanyBillingCustomer,
      _SlsOrgHierarchyNode,
      _Text
}
