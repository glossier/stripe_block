- view: balance_transaction_fee_details
  sql_table_name: stripe.balance_transaction_fee_details
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
    # hidden: true
    sql: ${TABLE}.balance_transaction_id

  - dimension: currency
    type: string
    sql: ${TABLE}.currency

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension_group: received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.received_at

  - dimension: type
    type: string
    sql: ${TABLE}.type

  - dimension: uuid
    type: number
    value_format_name: id
    sql: ${TABLE}.uuid

  - dimension_group: uuid_ts
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.uuid_ts

  - measure: count
    type: count
    drill_fields: [id, balance_transactions.id]

