- view: charges
  sql_table_name: stripe.charges
  fields:

## Dimensions
  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: amount
    type: number
    sql: ${TABLE}.amount*1.0/100
    value_format: '$#,##0.00'

  - dimension: amount_refunded
    type: number
    sql: ${TABLE}.amount_refunded*1.0/100
    value_format: '$#,##0.00'
    
  - dimension: application_fee
    type: string
    sql: ${TABLE}.application_fee
    
  - dimension: balance_transaction_id
    type: string
    sql: ${TABLE}.balance_transaction_id
    
  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: captured
    type: yesno
    sql: ${TABLE}.captured

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month, quarter]
    sql: ${TABLE}.created

  - dimension: currency
    type: string
    sql: ${TABLE}.currency

  - dimension: customer_id
    type: string
    # hidden: true
    sql: ${TABLE}.customer_id

  - dimension: dispute_id
    type: string
    sql: ${TABLE}.dispute_id

  - dimension: failure_code
    type: string
    sql: ${TABLE}.failure_code

  - dimension: invoice_id
    hidden: true
    type: string
    sql: ${TABLE}.invoice_id

  - dimension: paid
    type: yesno
    sql: ${TABLE}.paid

  - dimension_group: received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.received_at

  - dimension: refunded
    type: yesno
    sql: ${TABLE}.refunded

  - dimension: status
    type: string
    sql: ${TABLE}.status

## Measures
  - dimension: days_until_received
    type: number
    sql: datediff('days',${created_date},${received_date})
  
  - measure: avg_days_until_received
    type: avg
    sql: ${days_until_received}
    value_format: '#0.00'
    drill_fields: detail*
  
  - measure: total_gross_amount
    type: sum
    sql: ${amount}
    value_format: '$#,##0.00'
    drill_fields: detail*

  - measure: total_failed_charges
    type: sum
    sql: ${amount}
    value_format: '$#,##0.00'
    drill_fields: detail*
    filters:
      status: 'failed'
      
  - measure: total_refunds
    type: sum
    sql: ${amount_refunded}
    value_format: '$#,##0.00'
    drill_fields: detail*
      
  - measure: total_net_amount
    description: 'Gross-Refunds-Failed Charges'
    type: number
    sql: ${total_gross_amount} - ${total_refunds} - ${total_failed_charges}
    value_format: '$#,##0.00'
    drill_fields: detail*

  - measure: cumulative_gross
    type: running_total
    sql: ${total_gross_amount}
    value_format: '$#,##0.00'
    
  - measure: cumulative_refunds
    type: running_total
    sql: ${total_refunds}
    value_format: '$#,##0.00'

  - measure: cumulative_net
    type: running_total
    sql: ${total_net_amount}
    value_format: '$#,##0.00'

#   - measure: avg_charge_amount
#     type: avg
#     sql: (${total_gross_amount} - ${total_refunds} - ${total_failed_charges})
#     value_format: '$#,##0.00'

  - measure: charge_count
    type: count
    drill_fields: detail*

  - measure: refund_count
    type: count
    drill_fields: [id, customers.id, invoices.id, invoices.count, refunds.count]
    filters:
      refunded: 'Yes'



  # ----- Sets of fields for drilling ------
  sets:
    detail:
      - id
      - captured
      - amount
      - amount_refunded
      - currency
      - paid
      - invoice_id
      - failure_code
      - received
      - created_time
      - customers.email


