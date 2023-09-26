/*Creating custom tests */

{% test primary_key_custom(model, column_name) %}

WITH validation AS (
	SELECT
		{{ column_name}} AS primary_key,
		COUNT(1) AS occurence
	FROM {{ model }}
	GROUP BY 1
)

SELECT *
FROM validation
WHERE primary_key is NULL or occurence > 1

{% endtest %}


{% test col_greater_than(model, column_name,value=0 )%}

	SELECT
		column_name AS row_that_failed
	FROM {{model}}
	where {{ column_name }} <= {{value}}

{% endtest%}
