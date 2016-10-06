- view: cards
  sql_table_name: stripe.cards
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: address_city
    type: string
    sql: ${TABLE}.address_city

  - dimension: address_country
    type: string
    sql: ${TABLE}.address_country

  - dimension: address_line1
    type: string
    sql: ${TABLE}.address_line1

  - dimension: address_line1_check
    type: string
    sql: ${TABLE}.address_line1_check

  - dimension: address_line2
    type: string
    sql: ${TABLE}.address_line2

  - dimension: address_state
    type: string
    sql: ${TABLE}.address_state

  - dimension: address_zip
    type: string
    sql: ${TABLE}.address_zip

  - dimension: address_zip_check
    type: string
    sql: ${TABLE}.address_zip_check

  - dimension: brand
    type: string
    sql: ${TABLE}.brand

  - dimension: country
    type: string
    sql: ${TABLE}.country

  - dimension: cvc_check
    type: string
    sql: ${TABLE}.cvc_check

  - dimension: exp_month
    type: number
    sql: ${TABLE}.exp_month

  - dimension: exp_year
    type: number
    sql: ${TABLE}.exp_year

  - dimension: funding
    type: string
    sql: ${TABLE}.funding

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension_group: received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.received_at

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
    drill_fields: [id, name, charges.count]

