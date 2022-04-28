# The name of this view in Looker is "Cxinteraction Volume"
view: cxinteraction_volume {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `dev_kpis.cx-interaction_volume`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Agent Request" in Explore.

  dimension: agent_request {
    type: number
    sql: ${TABLE}.agentRequest ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_agent_request {
    type: sum
    sql: ${agent_request} ;;
  }

  measure: average_agent_request {
    type: average
    sql: ${agent_request} ;;
  }

  dimension: assistant_interactions {
    type: number
    sql: ${TABLE}.assistantInteractions ;;
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

  dimension: integration_error {
    type: number
    sql: ${TABLE}.integrationError ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}.language ;;
  }

  dimension: managed {
    type: number
    sql: ${TABLE}.managed ;;
  }

  dimension: service_error {
    type: number
    sql: ${TABLE}.serviceError ;;
  }

  dimension: total_interactions {
    type: number
    sql: ${TABLE}.totalInteractions ;;
  }

  dimension: unmanaged {
    type: number
    sql: ${TABLE}.unmanaged ;;
  }

  dimension: unsupported {
    type: number
    sql: ${TABLE}.unsupported ;;
  }

  dimension: user_interactions {
    type: number
    sql: ${TABLE}.userInteractions ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: suma_gestionadas {
    type: number
    sql: sum(${TABLE}.managed);;
    drill_fields: []
  }

  measure: porcentaje_gestionadas {
    type: number
    sql: sum(${managed})/sum(${user_interactions});;
    value_format: "0.00%"
    drill_fields: []
  }


  measure: suma_no_gestionadas {
    type: number
    sql: sum(${unmanaged});;
  }

  measure: porcentaje_no_gestionadas {
    type: number
    sql: sum(${unmanaged})/sum(${user_interactions});;
    value_format: "0.00%"
    drill_fields: []
  }

  measure: suma_interacciones {
    type: number
    sql: sum(${total_interactions}) ;;

  }

  measure: suma_no_soportada {
    type: number
    sql: sum(${unsupported}) ;;

  }

  measure: porcentaje_no_soportada {
    type: number
    sql: sum(${unsupported})/sum(${user_interactions});;
    value_format: "0.00%"
    drill_fields: []
  }


  measure: suma_error_servicio {
    type: number
    sql: sum(${service_error}) ;;

  }

  measure: porcentaje_error_servicio {
    type: number
    sql: sum(${service_error})/sum(${user_interactions});;
    value_format: "0.00%"
    drill_fields: []
  }

  measure: suma_error_integracion {
    type: number
    sql: sum(${integration_error}) ;;

  }

  measure: porcentaje_error_integracion {
    type: number
    sql: sum(${integration_error})/sum(${user_interactions});;
    value_format: "0.00%"
    drill_fields: []
  }



}
