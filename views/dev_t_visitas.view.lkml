# The name of this view in Looker is "Dev T Visitas"
view: dev_t_visitas {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `dev_kpis.dev_t_visitas`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Channel" in Explore.

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

  dimension: duracion_media_visitas_activas {
    type: number
    sql: ${TABLE}.duracionMediaVisitasActivas ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_duracion_media_visitas_activas {
    type: sum
    sql: ${duracion_media_visitas_activas} ;;
  }

  measure: average_duracion_media_visitas_activas {
    type: average
    sql: ${duracion_media_visitas_activas} ;;
  }

  dimension: user_mensajes {
    type: number
    sql: ${TABLE}.userMensajes ;;
  }

  dimension: visitas {
    type: number
    sql: ${TABLE}.visitas ;;
  }

  dimension: visitas_activas {
    type: number
    sql: ${TABLE}.visitasActivas ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
