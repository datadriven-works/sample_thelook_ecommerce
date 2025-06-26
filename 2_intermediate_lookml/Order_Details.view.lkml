# If necessary, uncomment the line below to include explore_source.

# include: "intermediate_example_ecommerce.explore.lkml"

view: order_details{
  derived_table: {
    explore_source: intermediate_example_ecommerce {
      column: brand { field: products.brand }
      column: count { field: order_items.count }
      column: name { field: products.name }
      column: average_sale_price { field: order_items.average_sale_price }
    }
  }
  dimension: brand {
    description: ""
  }
  dimension: count {
    label: "Order Items # of Order Items"
    description: ""
    type: number
  }
  dimension: name {
    label: "Products Product Name"
    description: ""
  }
  dimension: average_sale_price {
    label: "Order Items Average Price"
    description: ""
    value_format: "string"
    type: number
  }
}

# }
