- view: application_fees
  sql_table_name: stripe.application_fees
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: account_id
    type: string
    # hidden: true
    sql: ${TABLE}.account_id

  - dimension: amount
    type: number
    sql: ${TABLE}.amount

  - dimension: amount_refunded
    type: number
    sql: ${TABLE}.amount_refunded

  - dimension: application_id
    type: string
    sql: ${TABLE}.application_id

  - dimension: balance_transaction_id
    type: string
    # hidden: true
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

  - dimension: originating_transaction
    type: string
    sql: ${TABLE}.originating_transaction

  - dimension_group: received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.received_at

  - dimension: refunded
    type: yesno
    sql: ${TABLE}.refunded

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
    drill_fields: [id, accounts.id, accounts.display_name, balance_transactions.id, charges.id]

