- view: accounts
  sql_table_name: stripe.accounts
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: business_url
    type: string
    sql: ${TABLE}.business_url

  - dimension: charges_enabled
    type: yesno
    sql: ${TABLE}.charges_enabled

  - dimension: country
    type: string
    sql: ${TABLE}.country

  - dimension: currencies_supported
    type: string
    sql: ${TABLE}.currencies_supported

  - dimension: default_currency
    type: string
    sql: ${TABLE}.default_currency

  - dimension: details_submitted
    type: yesno
    sql: ${TABLE}.details_submitted

  - dimension: display_name
    type: string
    sql: ${TABLE}.display_name

  - dimension: email
    type: string
    sql: ${TABLE}.email

  - dimension: managed
    type: yesno
    sql: ${TABLE}.managed

  - dimension_group: received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.received_at

  - dimension: statement_descriptor
    type: string
    sql: ${TABLE}.statement_descriptor

  - dimension: support_phone
    type: string
    sql: ${TABLE}.support_phone

  - dimension: timezone
    type: string
    sql: ${TABLE}.timezone

  - dimension: transfers_enabled
    type: yesno
    sql: ${TABLE}.transfers_enabled

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
    drill_fields: [id, display_name, application_fees.count]

