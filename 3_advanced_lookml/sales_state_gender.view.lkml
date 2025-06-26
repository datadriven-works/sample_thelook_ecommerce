# If necessary, uncomment the line below to include explore_source.

# include: "advanced_example_ecommerce.explore.lkml"

view: sales_state_gender{
  derived_table: {
    explore_source: advanced_example_ecommerce {
      column: gender { field: users.gender }
      column: total_sale_price { field: order_items.total_sale_price }
      column: state { field: users.state }
      filters: {
        field: priority_item_filter_feature_support.priority_items_only_toggle
        value: "AllItems"
      }
      filters: {
        field: users.country
        value: "Spain"
      }
    }
  }
  dimension: gender {
    description: ""
  }
  measure: total_sale_price {
    label: "Order Items Sales"
    type: sum
    sql: ${advanced_orders_items.sale_price} ;;
  }
  dimension: state {
    description: ""
  }

  measure: avg_sale_price {
    type: average
    sql: ${advanced_orders_items.sale_price} ;;
    value_format_name: short_dollars
}
}
