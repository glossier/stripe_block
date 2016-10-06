- view: balance_transactions
  sql_table_name: stripe.balance_transactions
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: amount
    type: number
    sql: ${TABLE}.amount

  - dimension_group: available
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.available

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created

  - dimension: currency
    type: string
    sql: ${TABLE}.currency

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: fee
    type: number
    sql: ${TABLE}.fee

  - dimension: net
    type: number
    sql: ${TABLE}.net

  - dimension_group: received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.received_at

  - dimension: source
    type: string
    sql: ${TABLE}.source

  - dimension: sourced_transfers
    type: string
    sql: ${TABLE}.sourced_transfers

  - dimension: status
    type: string
    sql: ${TABLE}.status

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
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - application_fees.count
    - balance_transaction_fee_details.count
    - charges.count
    - refunds.count
    - transfers.count

