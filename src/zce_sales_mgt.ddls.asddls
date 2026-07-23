@EndUserText.label: 'Custom Entity - Sales Management'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_CE_SALES_MGT'
@Metadata.allowExtensions: true
define root custom entity zce_sales_mgt
{
  key salesOrder                  : vbeln; // Line 20 - Sales Order - I_SalesOrderItem-SalesOrder
  key salesOrderItem              : posnr; // Line 30 - Sales Order Item - I_SalesOrderItem-SalesOrderItem
  key outboundDelivery            : vbeln; // Line 80 - Outbound Delivery - I_OutboundDeliveryItem-OutboundDelivery
  key outboundDeliveryItem        : posnr; // Line 90 - Outbound Delivery Item - I_OutboundDeliveryItem-OutboundDeliveryItem
  key materialDocument            : mblnr; // Line 110 - Material Document - I_MaterialDocumentItem_2-MaterialDocument
  key billingDocument             : abap.char(10); // Line 180 - Billing Document - I_BillingDocumentItem-BillingDocument
  key journalEntry                : abap.char(10); // Line 190 - Journal Entry - I_GLAccountLineItemSemTag-AccountingDocument

      customerReference           : bstkd; // Line 10 - Customer Reference - I_SalesOrderItem-PurchaseOrderByCustomer
      @ObjectModel.text.element   : ['searchTerm1']
      soldToParty                 : kunag; // Line 40 - Sold-to-party - I_SalesOrderItem-SoldToParty
      searchTerm1                 : abap.char(20); // Text for Sold-to-party
      @ObjectModel.text.element   : ['shipToPartyName']
      shipToParty                 : kunwe; // Line 50 - Ship-to-party - I_SalesOrderItem-ShipToParty
      shipToPartyName             : abap.char(40); // Text for Ship-to-party and Bill-to-party
      payer                       : kunrg; // Line 60 - Payer - I_SalesOrderItem-PayerParty
      payerName                   : abap.string;
      payerAddress                : abap.string;
      @ObjectModel.text.element   : ['billToPartyName']
      billToParty                 : kunre; // Line 70 - Bill-to-party - I_SalesOrderItem-BillToParty
      billToPartyName             : abap.char(40); // Text for Bill-to-party
      plannedGoodsMovementDate    : abap.dats; // Line 100 - I_OutboundDelivery-PlannedGoodsIssueDate
      material                    : matnr; // Line 110 - Material - I_SalesOrderItem-Material
      productName                 : abap.char(40); // Line 111 - Material Description - I_ProductText-ProductName
      materialLongText            : abap.string; // Line 112
      plant                       : werks_d; // Line 130 - Plant - I_MaterialDocumentItem_2-Plant
      storageLocation             : lgort_d; // Line 140 - Storage Location - I_MaterialDocumentItem_2-StorageLocation
      quantity                    : abap.dec(13,3); // Line 160 - Quantity - I_MaterialDocumentItem_2-QuantityInBaseUnit
      goodsReceiptDate            : abap.dats; // Line 170 - Goods Receipt Date - I_MaterialDocumentItem_2-PostingDate
      billingDate                 : abap.dats; // Line 200 - Billing Date - I_GLAccountLineItemSemTag-PostingDate
      reference                   : abap.char(16); // Line 210 - Reference - I_JournalEntry-DocumentReferenceID
      commercialInvoice           : abap.string; // Line 220 - Commercial Invoice - Get Header Text in VF03

      //Update fields
      salesOrganization           : vkorg; // Line 1 - Sales Organization - I_SalesOrderItem-SalesOrganization
      documentDate                : abap.dats; // Line 2 - Document Date - I_SalesOrderItem-SalesOrderDate
      distributionChannel         : vtweg; // Line 3 - Distribution Channel - I_SalesOrderItem-DistributionChannel
      division                    : spart; // Line 4 - Division - I_SalesOrderItem-Division

      @ObjectModel.text.element   : ['sDProcessStatusDesc']
      sDProcessStatus             : abap.char(1); // Line 31 - Overall Delivery Status (Item) - I_SalesOrderItem-totalDeliveryStatus
      sDProcessStatusDesc         : abap.char(20); // Line 31 - Overall Delivery Status (Item) - I_SalesOrderItem-totalDeliveryStatus
      @ObjectModel.text.element   : ['salesDocumentRjcnReasonName']
      salesDocumentRjcnReason     : abap.char(2); // Line 32 - Rejection Reason - I_SalesOrderItem-SalesDocumentRjcnReason
      salesDocumentRjcnReasonName : bezei40; // Line 32 - Rejection Reason - I_SalesOrderItem-SalesDocumentRjcnReason

      soToKhaiXK                  : abap.string; // Số tờ khai xuất khẩu - Long text I_BillingDocumentTextTP --> LongtextID = Z020
      soHopDongUyThacXK           : abap.string; // Số hợp đồng ủy thác XK - Long text I_BillingDocumentTextTP --> LongtextID = Z011

      criticality                 : abap.numc(1); // Code đánh dấu line chưa đủ luồng chứng từ
}
