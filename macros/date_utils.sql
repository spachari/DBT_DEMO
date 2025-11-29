{% macro get_season(day_value) %}
    case when Month({{ day_value }}) in (12,1,2) then 'WINTER'
         when Month({{ day_value }}) in (3,4,5) then 'SPRING'
         when Month({{ day_value }}) in (6,7,8) then 'SUMMER'
         when Month({{ day_value }}) in (9,10,11) then 'AUTUMN' end
{% endmacro %}

{% macro get_day_type(day_value) %}
    case when DAYNAME({{ day_value }}) in ('Sat', 'Sun') then 'WEEKEND' else 'WEEKDAY' end
{% endmacro %}