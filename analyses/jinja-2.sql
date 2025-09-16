{%- set apples = [
    {"name": "Fuji", "color": "red"},
    {"name": "Gala", "color": "yellow"},
    {"name": "Granny Smith", "color": "green"},
] -%}


{%- for apple in apples -%}
    {%- if apple.color == "red" -%}
        {{ apple.name }} is a red apples.
    {%- elif apple.color == "yellow" -%}
        {{ apple.name }} is a yellow apple.
    {%- else -%}
        {{ apple.name }} is a green apple.
    {%- endif -%}
{%- endfor -%}          