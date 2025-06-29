# If necessary, uncomment the line below to include explore_source.

# include: "intermediate_example_ecommerce.explore.lkml"

view: brand_sales {
  derived_table: {
    explore_source: intermediate_example_ecommerce {
      column: brand { field: products.brand }
      column: total_sale_price { field: order_items.total_sale_price }
      derived_column: brand_rank {
        sql: row_number() over (order by total_sale_price desc) ;;
      }

    }
  }
  dimension: brand_rank {
    hidden: yes
    type:  number
  }

  dimension: brand {
    primary_key: yes
    description: ""
  }
  dimension: total_sale_price {
    label: "Order Items Sales"
    description: ""
    value_format: "[>=999.5]$#,##0.0,\" K\";$#,##0"
    type: number
  }

  dimension: brand_rank_concat {
    label: "Brand Rank + Name"
    type: string
    sql: ${brand_rank} || ') ' || ${brand} ;;
  }

  dimension: brand_rank_top_5 {
    hidden: yes
    type: yesno
    sql:  ${brand_rank} <= 5 ;;
  }

  dimension: brand_rank_grouped {
    label: " Brand Name Grouped"
    type:  string
    sql:  case when ${brand_rank_top_5} then ${brand_rank_concat} else '6) Other' end ;;
  }
}
