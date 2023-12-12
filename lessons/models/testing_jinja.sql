{# This is a jinja commants #}
{#
	multi like jinja comments
 #}
/*SQL LINE COMMENT*/
{% set my_variable %}
	SELECT 1 as my_col
{%- endset%}

{{ my_variable}}
{{ my_variable}}
{{ my_variable}}


{% set mylist = ['user_id','user_name','created_at'] %}


SELECT
{% for item in mylist%}
	{{item}}{% if not loop.last%},{% endif%}
{%- endfor%}