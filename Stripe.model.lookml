- connection: segment

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: charges
  label: 'Charges'
  joins:
    - join: calendar
      type: left_outer
      sql_on:  ${calendar.cal_date_date} = ${charges.created_date} 
      relationship: one_to_many
      
    - join: customers
      type: left_outer 
      sql_on: ${charges.customer_id} = ${customers.id}
      relationship: many_to_one
      
    - join: balance_transactions
      sql_on: ${balance_transactions.id} = ${charges.balance_transaction_id}
      relationship: one_to_many
      
    - join: application_fees
      sql_on: ${application_fees.charge_id} = ${charges.id}
      relationship: one_to_one
      
    - join: transfers
      sql_on: ${charges.id} = ${transfers.source_transaction} 
      relationship: one_to_many
      
    
      
# - explore: transfers
#   joins:
#     - join: balance_transactions
#       sql_on: ${transfers.balance_transaction_id} = 
#       relationship: one_to_many
#     
#     - join: charges
#       sql_on: ${charges.balance_transaction_id} = ${balance_transactions.id}
#       relationship: one_to_many

# - explore: customers
#   from: calendar
#   label: 'Customers'
#   joins:
#     - join: customers
#       type: left_outer
#       sql_on: ${customer.cal_date_date} = ${customers.created_date}
#       relationship: one_to_many

- explore: refunds
  joins:
    - join: charges
      sql_on: ${charges.id} = ${refunds.charge_id}
      relationship: one_to_one
      
    - join: balance_transactions
      sql_on: ${balance_transactions.id} = ${refunds.balance_transaction_id}
      relationship: one_to_one



