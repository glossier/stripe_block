- view: customers
  sql_table_name: stripe.customers
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: account_balance
    type: number
    sql: ${TABLE}.account_balance

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created

  - dimension: delinquent
    type: yesno
    sql: ${TABLE}.delinquent

  - dimension: email
    type: string
    sql: ${TABLE}.email

  - dimension_group: received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.received_at

  - dimension: source_ids
    type: string
    sql: ${TABLE}.source_ids

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
    drill_fields: [id, charges.count]

