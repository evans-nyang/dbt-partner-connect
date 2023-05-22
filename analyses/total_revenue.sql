with payments as (

    select * from {{ ref ('stg_payments') }}

),

aggregated as (

    select

    {% for payment_status in ['success'] %}

        sum(case when status = '{{ payment_status }}' then amount else 0 end) as total_revenue {{ ',' if not loop.last }}

    {% endfor %}

    from payments
)

select * from aggregated