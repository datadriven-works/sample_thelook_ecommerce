# If necessary, uncomment the line below to include explore_source.

# include: "intermediate_example_ecommerce.explore.lkml"

view: brand_profit{
  derived_table: {
    explore_source: intermediate_example_ecommerce {
      column: brand { field: products.brand }
      column: cost { field: products.cost }
      column: average_sale_price { field: order_items.average_sale_price }
      column: count { field: order_items.count }
      filters: {
        field: order_items.created_at_month
        value: "6 months"
      }
    }
  }
  dimension: brand {
    description: ""
  }
  dimension: cost {
    description: ""
    value_format: "[>=999.5]$#,##0.0,\" K\";$#,##0"
    type: number
  }
  measure: average_sale_price {
    label: "Order Items Average Price"
    description: ""
    value_format: "[>=999.5]$#,##0.0,\" K\";$#,##0"
    type: number
  }
  measure: count {
    label: "Order Items # of Order Items"
    description: ""
    type: number
  }

  measure: average_profit {
    type: number
    sql: ${products.average_retail_price} - ${inventory_items.average_cost} ;;
    value_format_name: usd_0
  }
}
