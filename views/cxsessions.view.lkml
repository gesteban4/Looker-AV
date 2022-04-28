# The name of this view in Looker is "Cxsessions"
view: cxsessions {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `dev_kpis.cx-sessions`
    ;;
    drill_fields: [sessions, language]
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Active Sessions" in Explore.

  dimension: active_sessions {
    type: number
    sql: ${TABLE}.activeSessions ;;
  }

  dimension: active_sessions_duration {
    type: number
    sql: ${TABLE}.activeSessionsDuration ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_active_sessions_duration {
    type: sum
    sql: ${active_sessions_duration} ;;
  }

  measure: average_active_sessions_duration {
    type: average
    sql: ${active_sessions_duration} ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
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

  dimension: language {
    type: string
    sql: ${TABLE}.language ;;
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}.sessions ;;
  }

  dimension: silent_sessions {
    type: number
    sql: ${TABLE}.silentSessions ;;
  }

  dimension: user_identified_calls {
    type: number
    sql: ${TABLE}.userIdentifiedCalls ;;
  }

  dimension: user_interactions {
    type: number
    sql: ${TABLE}.userInteractions ;;
  }

  dimension: users {
    type: number
    sql: ${TABLE}.users ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }


measure: suma_sesiones {
  type: sum
  sql: ${sessions} ;;
  drill_fields: []
  value_format_name : decimal_0
}

  measure: suma_iniciadas {
    type: sum
    sql: ${active_sessions} ;;
    drill_fields: []
    value_format_name : decimal_0
  }

  measure: suma_silencio {
    type: sum
    sql: ${silent_sessions} ;;
    drill_fields: []
    value_format_name : decimal_0
  }


  measure: iniciadas_entre_sesiones{
    type: number
    sql: sum ${active_sessions}/sum ${sessions} ;;
    drill_fields: []
    value_format_name : percent_1
  }

  measure: porcen_sesiones_iniciadas{
    type: sum
    sql: ${active_sessions}/${sessions};;
    drill_fields: []
    value_format_name : percent_1
  }

}
