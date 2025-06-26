# If necessary, uncomment the line below to include explore_source.

# include: "intermediate_example_ecommerce.explore.lkml"

view: product_price {
  derived_table: {
    explore_source: intermediate_example_ecommerce {
      column: name { field: products.name }
      column: retail_price { field: products.retail_price }
      column: cost { field: products.cost }
      column: count { field: products.count }
    }
  }
  dimension: name {
    primary_key: yes
    label: "Products Product Name"
    description: ""


  }
  dimension: retail_price {
    description: ""
    value_format:  "[>=999.5]$#,##0.0,\" K\";$#,##0"
    type: number
  }
  dimension: cost {
    description: ""
    value_format: "[>=999.5]$#,##0.0,\" K\";$#,##0"
    type: number
  }
  dimension: count {
    label: "Products Count Distinct Products"
    description: ""
    type: number
  }

  measure: total_cost {
    type:  sum
    sql:  ${cost} ;;
    value_format_name: usd
  }
}
