# If necessary, uncomment the line below to include explore_source.

# include: "intermediate_example_ecommerce.explore.lkml"

view: category_sales {
  derived_table: {
    explore_source: intermediate_example_ecommerce {
      column: category { field: products.category }
      column: total_sale_price { field: order_items.total_sale_price }
      filters: {
        field: order_items.created_at_quarter
        value: "1 quarters"
      }
    }
  }
  dimension: category {
    primary_key: yes
    description: ""
  }
  measure: total_sale_price {
    type: sum
    label: "Order Items Sales"
    description: ""
    value_format: "[>=999.5]$#,##0.0,\" K\";$#,##0"
  }
}
