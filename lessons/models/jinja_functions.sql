{# Get all columns in a table #}
{% set colummns = adapter.get_columns_in_relation(ref('dim_orders')) %}

{# get all colums in table and check if they start with 'total' #}

SELECT
{% for column in colummns -%}
	{%- if column.name.startswith('total') %}
	{{ column.name.lower()}},
	{%- endif -%}
{%- endfor %}

{# Get all values from column in the table #}
{% set values = dbt_utils.get_column_values(ref('dim_orders'),'order_status') %}
{{ values }}
{{ values }}