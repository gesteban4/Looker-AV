# The name of this view in Looker is "Dev Cx End Sessions"
view: dev_cx_end_sessions {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `dev_kpis.dev_cx_end_sessions`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Active Sessions" in Explore.

  dimension: active_sessions {
    type: number
    sql: ${TABLE}.activeSessions ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_active_sessions {
    type: sum
    sql: ${active_sessions} ;;
  }

  measure: average_active_sessions {
    type: average
    sql: ${active_sessions} ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: completed {
    type: number
    sql: ${TABLE}.completed ;;
  }

  dimension: completed_by_assistant {
    type: number
    sql: ${TABLE}.completedByAssistant ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: hang_up {
    type: number
    sql: ${TABLE}.hangUp ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}.language ;;
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}.sessions ;;
  }

  dimension: transferred {
    type: number
    sql: ${TABLE}.transferred ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
