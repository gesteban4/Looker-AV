# The name of this view in Looker is "Dev T Volumen Mensajes"
view: dev_t_volumen_mensajes {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `dev_kpis.dev_t_volumen_mensajes`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Assistant Mensajes" in Explore.

  dimension: assistant_mensajes {
    type: number
    sql: ${TABLE}.assistantMensajes ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_assistant_mensajes {
    type: sum
    sql: ${assistant_mensajes} ;;
  }

  measure: average_assistant_mensajes {
    type: average
    sql: ${assistant_mensajes} ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
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

  dimension: error {
    type: number
    sql: ${TABLE}.error ;;
  }

  dimension: gestionado {
    type: number
    sql: ${TABLE}.gestionado ;;
  }

  dimension: no_gestionado {
    type: number
    sql: ${TABLE}.noGestionado ;;
  }

  dimension: total_mensajes {
    type: number
    sql: ${TABLE}.totalMensajes ;;
  }

  dimension: user_mensajes {
    type: number
    sql: ${TABLE}.userMensajes ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
