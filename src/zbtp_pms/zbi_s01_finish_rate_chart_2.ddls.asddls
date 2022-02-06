@EndUserText.label: 'Projection view for finished'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@AbapCatalog.sqlViewName: 'ZDEMORATECHART'
@AbapCatalog.compiler.compareFilter: true

@AbapCatalog.preserveKey: true
@UI.chart: [
  {
    title: 'Revenue by Customer',
    description: 'Net Revenue by Customer',
    chartType: #COLUMN,
    dimensions: [
      'ProjectID',
      'DevStartMonth'
    ],
    dimensionAttributes: [
      {
        dimension: 'ProjectID',
        role: #CATEGORY
      },
      {
        dimension: 'DevStartMonth',
        role: #SERIES
      }
    ],
    measures: [
      'FinishNum'
    ],
    measureAttributes: [
      {
        measure: 'FinishNum',
        role: #AXIS_1,
        asDataPoint: true
      }
    ],
    qualifier: 'Default'
  }
]
define root view  ZBC_S01_FINISH_RATE_CHART_2
  as select from ZBI_S01_FINISH_RATE
{
  key projectId as ProjectID,
   key   devStartMonth as DevStartMonth,
      plan_Num as PlanNum,
      finish_Num as FinishNum,
      rate as FinishRate
}
