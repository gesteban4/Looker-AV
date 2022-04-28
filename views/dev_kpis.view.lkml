# The name of this view in Looker is "Dev Kpis"
view: dev_kpis {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `dev_kpis.dev_kpis`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Agent Confidence" in Explore.

  dimension: agent_confidence {
    type: number
    sql: ${TABLE}.agentConfidence ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_agent_confidence {
    type: sum
    sql: ${agent_confidence} ;;
  }

  measure: average_agent_confidence {
    type: average
    sql: ${agent_confidence} ;;
  }

  dimension: assistant_response {
    type: string
    sql: ${TABLE}.assistantResponse ;;
  }

  dimension: categories {
    type: string
    sql: ${TABLE}.categories ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: classification {
    type: string
    sql: ${TABLE}.classification ;;
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

  dimension: end_conversation {
    type: yesno
    sql: ${TABLE}.endConversation ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: flow {
    type: string
    sql: ${TABLE}.flow ;;
  }

  dimension: intent {
    type: string
    sql: ${TABLE}.intent ;;
  }

  dimension: latency {
    type: number
    sql: ${TABLE}.latency ;;
  }

  dimension: operator {
    type: yesno
    sql: ${TABLE}.operator ;;
  }

  dimension: orchestrator_agent {
    type: string
    sql: ${TABLE}.orchestratorAgent ;;
  }

  dimension: orchestrator_confidence {
    type: number
    sql: ${TABLE}.orchestratorConfidence ;;
  }

  dimension: page {
    type: string
    sql: ${TABLE}.page ;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.sessionID ;;
  }

  dimension: specific_agent {
    type: string
    sql: ${TABLE}.specificAgent ;;
  }

  dimension: subcategories {
    type: string
    sql: ${TABLE}.subcategories ;;
  }

  dimension: time {
    type: string
    sql: ${TABLE}.time ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.userID ;;
  }

  dimension: user_message {
    type: string
    sql: ${TABLE}.userMessage ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
