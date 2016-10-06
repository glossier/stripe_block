- view: bank_accounts
  sql_table_name: stripe.bank_accounts
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: bank_name
    type: string
    sql: ${TABLE}.bank_name

  - dimension: country
    type: string
    sql: ${TABLE}.country

  - dimension_group: received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.received_at

  - dimension: status
    type: string
    sql: ${TABLE}.status

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
    drill_fields: [id, bank_name, transfers.count]

