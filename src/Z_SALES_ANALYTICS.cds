@AbapCatalog.sqlViewName: 'ZSALESANAV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Data Analytics: Sales Document View'
@Analytics.dataCategory: #CUBE

define view Z_SALES_ANALYTICS 
  as select from vbak as Header
  inner join vbap as Item on Header.vbeln = Item.vbeln 
{
  key Header.vbeln as SalesOrder,
  key Item.posnr   as ItemNumber,
  
  Header.erdat     as CreationDate,
  Header.kunnr     as Customer,
  Header.vkorg     as SalesOrganization,
  Item.matnr       as MaterialNumber,
  
  @DefaultAggregation: #SUM
  Header.netwr     as NetValue,
  Header.waerk     as Currency,
  
  @DefaultAggregation: #SUM
  Item.kwmeng      as OrderQuantity,
  Item.vrkme       as SalesUnit
}
