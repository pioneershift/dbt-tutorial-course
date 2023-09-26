{{
  config(
	group = 'sales',
	)
}}
select * from {{ ref('dim_orders') }}