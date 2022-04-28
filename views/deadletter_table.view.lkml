# The name of this view in Looker is "Deadletter Table"
view: deadletter_table {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `dev_kpis.DeadletterTable`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: attributes {
    hidden: yes
    sql: ${TABLE}.attributes ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Error Message" in Explore.

  dimension: error_message {
    type: string
    sql: ${TABLE}.errorMessage ;;
  }

  dimension: payload_bytes {
    type: string
    sql: ${TABLE}.payloadBytes ;;
  }

  dimension: payload_string {
    type: string
    sql: ${TABLE}.payloadString ;;
  }

  dimension: stacktrace {
    type: string
    sql: ${TABLE}.stacktrace ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.timestamp ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

# The name of this view in Looker is "Deadletter Table Attributes"
view: deadletter_table__attributes {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: deadletter_table__attributes {
    type: string
    hidden: yes
    sql: deadletter_table__attributes ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Key" in Explore.

  dimension: key {
    type: string
    sql: key ;;
  }

  dimension: value {
    type: string
    sql: value ;;
  }
}
