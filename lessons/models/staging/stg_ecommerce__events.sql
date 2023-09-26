 {{
	config(
		materialized = 'incremental',
		unique_key = 'event_id',
		on_schema_change = 'sync_all_columns',
		partition_by={
			"field": "created_at",
			"data_type": "timestamp",
			"granularity": "day"
		}

	)
 }}

 WITH source AS (
	select *
		FROM {{ source('thelook_ecommerce', 'events')}}
		{# WHERE created_at <= '2023-02-06' #}
		{# WHERE created_at <= '2023-07-06' #}
 )
 SELECT
	id as event_id,
	user_id,
	sequence_number,
	session_id,
	created_at,
	ip_address,
	city,
	state,
	postal_code,
	browser,
	traffic_source,
	uri as web_link,
	event_type
FROM source

{% if is_incremental() %}
  where created_at > (select max(created_at) from {{ this}})
  {# and prefix.date_col >= coalesce((select max(date_col) from {{ this }}), '1900-01-01') #}
{# {% else %} #}
  {# optional_cond #}
{% endif %}
