WITH source AS (
    SELECT * FROM {{ source('gz_raw_data', 'raw_gz_product') }}
),

renamed AS (
    SELECT
        products_id,
        cast(purchse_price as FLOAT64) AS purchase_price
    FROM source
)

SELECT * FROM renamed