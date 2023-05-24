{%- set payment_status = ['success', 'fail'] -%}

with payments as (

    select * from {{ ref ('stg_payments') }}

),

aggregated as (

    select
        {% for status in payment_status %}

            sum(case when status = '{{ status }}' then amount else 0 end) as {{ status }}_revenue {{ ',' if not loop.last }}

        {% endfor %}

    from payments
    
)

select * from aggregated