- view: transfers
  sql_table_name: stripe.transfers
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: amount
    type: number
    sql: ${TABLE}.amount

  - dimension: amount_reversed
    type: number
    sql: ${TABLE}.amount_reversed

  - dimension: balance_transaction_id
    type: string
    # hidden: true
    sql: ${TABLE}.balance_transaction_id

  - dimension: bank_account_id
    type: string
    # hidden: true
    sql: ${TABLE}.bank_account_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created

  - dimension: currency
    type: string
    sql: ${TABLE}.currency

  - dimension_group: date
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: destination_id
    type: string
    sql: ${TABLE}.destination_id

  - dimension: destination_payment
    type: string
    sql: ${TABLE}.destination_payment

  - dimension_group: received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.received_at

  - dimension: reversed
    type: yesno
    sql: ${TABLE}.reversed

  - dimension: source_transaction
    type: string
    sql: ${TABLE}.source_transaction

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
    drill_fields: [id, balance_transactions.id, bank_accounts.id, bank_accounts.bank_name]

