# The name of this view in Looker is "Dev T Valoraciones"
view: dev_t_valoraciones {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `dev_kpis.dev_t_valoraciones`
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

  dimension: total_valoraciones {
    type: number
    sql: ${TABLE}.TotalValoraciones ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_total_valoraciones {
    type: sum
    sql: ${total_valoraciones} ;;
  }

  measure: average_total_valoraciones {
    type: average
    sql: ${total_valoraciones} ;;
  }

  dimension: valoracion_no {
    type: number
    sql: ${TABLE}.valoracionNo ;;
  }

  dimension: valoracion_si {
    type: number
    sql: ${TABLE}.valoracionSi ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
