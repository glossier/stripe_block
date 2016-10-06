- view: refunds
  sql_table_name: stripe.refunds
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: amount
    type: number
    sql: ${TABLE}.amount

  - dimension: balance_transaction_id
    type: string
    sql: ${TABLE}.balance_transaction_id

  - dimension: charge_id
    type: string
    # hidden: true
    sql: ${TABLE}.charge_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created

  - dimension: currency
    type: string
    sql: ${TABLE}.currency

  - dimension_group: received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.received_at

  - measure: count
    type: count
    drill_fields: [id, charges.id]

