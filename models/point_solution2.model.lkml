# Define the database connection to be used for this model.
connection: "point-solutions-test"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: point_solution2_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: point_solution2_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Point Solution2"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: cxsessions {
  join: cxinteraction_volume {
    type: inner
    sql_on: ${cxsessions.date_date} = ${cxinteraction_volume.date_date};;
    relationship: one_to_one
  }
  join: dev_cx_last_interaction {
    type: left_outer
    sql_on: ${cxinteraction_volume.date_date} = ${dev_cx_last_interaction.date_date};;
    relationship: one_to_one
  }
  join: cxroutes {
    type: full_outer
    sql_on: ${cxsessions.date_date} = ${cxroutes.date};;
    relationship: one_to_one

}

}

explore: cxroutes {}
