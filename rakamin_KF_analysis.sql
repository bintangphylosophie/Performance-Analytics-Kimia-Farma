-- rename column 'rating' into 'rating_transaksi'
ALTER TABLE kimia_farma.ft
RENAME COLUMN rating TO rating_transaksi;

-- rename column'rating' into 'rating_cabang'
ALTER TABLE kimia_farma.kc
RENAME COLUMN rating TO rating_cabang;

-- join tabel
/*
SELECT DISTINCT 
    ft.*, 
    i.product_name, 
    kc.kota, 
    kc.provinsi, 
    kc.rating_cabang,
    kc.nama_cabang,
    
    -- Calculate 'persentase_gross_laba' based on price ranges
    CASE 
        WHEN ft.price <= 50000 THEN 0.10
        WHEN ft.price > 50000 AND ft.price <= 100000 THEN 0.15
        WHEN ft.price > 100000 AND ft.price <= 300000 THEN 0.20
        WHEN ft.price > 300000 AND ft.price <= 500000 THEN 0.25
        WHEN ft.price > 500000 THEN 0.30
    END AS persentase_gross_laba,

    -- Calculate 'nett_sales' (price after discount)
    ROUND(ft.price * (1 - ft.discount_percentage / 100),2) AS nett_sales,

    -- Calculate 'nett_profit' (profit obtained by Kimia Farma)
    ROUND(ft.price * (1 - ft.discount_percentage / 100) * 
    CASE 
        WHEN ft.price <= 50000 THEN 0.10
        WHEN ft.price > 50000 AND ft.price <= 100000 THEN 0.15
        WHEN ft.price > 100000 AND ft.price <= 300000 THEN 0.20
        WHEN ft.price > 300000 AND ft.price <= 500000 THEN 0.25
        WHEN ft.price > 500000 THEN 0.30
    END,2) AS nett_profit

FROM kimia_farma.ft AS ft
LEFT JOIN kimia_farma.i AS i 
    ON ft.product_id = i.product_id 
    AND ft.branch_id = i.branch_id
LEFT JOIN kimia_farma.kc AS kc
    ON ft.branch_id = kc.branch_id;
*/

-- make the code as an actual tabel
CREATE TABLE kimia_farma.kimia_farma AS
SELECT DISTINCT 
    ft.*, 
    i.product_name, 
    kc.kota, 
    kc.provinsi, 
    kc.rating_cabang,
    kc.branch_name,

    -- Calculate 'persentase_gross_laba' based on price ranges
    CASE 
        WHEN ft.price <= 50000 THEN 0.10
        WHEN ft.price > 50000 AND ft.price <= 100000 THEN 0.15
        WHEN ft.price > 100000 AND ft.price <= 300000 THEN 0.20
        WHEN ft.price > 300000 AND ft.price <= 500000 THEN 0.25
        WHEN ft.price > 500000 THEN 0.30
    END AS persentase_gross_laba,

    -- Calculate 'nett_sales' (price after discount)
    ROUND(ft.price * (1 - ft.discount_percentage / 100),2) AS nett_sales,

    -- Calculate 'nett_profit' (profit obtained by Kimia Farma)
    ROUND(ft.price * (1 - ft.discount_percentage / 100) * 
    CASE 
        WHEN ft.price <= 50000 THEN 0.10
        WHEN ft.price > 50000 AND ft.price <= 100000 THEN 0.15
        WHEN ft.price > 100000 AND ft.price <= 300000 THEN 0.20
        WHEN ft.price > 300000 AND ft.price <= 500000 THEN 0.25
        WHEN ft.price > 500000 THEN 0.30
    END,2) AS nett_profit

FROM kimia_farma.ft AS ft
LEFT JOIN kimia_farma.i AS i 
    ON ft.product_id = i.product_id 
    AND ft.branch_id = i.branch_id
LEFT JOIN kimia_farma.kc AS kc
    ON ft.branch_id = kc.branch_id;
    
-- check missing value
SELECT * 
FROM kimia_farma.kimia_farma
WHERE 
    product_name IS NULL 
    OR kota IS NULL 
    OR provinsi IS NULL 
    OR rating_cabang IS NULL 
    OR persentase_gross_laba IS NULL 
    OR nett_sales IS NULL 
    OR nett_profit IS NULL
    OR product_name IS NULL;

-- imputation missing value 
MERGE kimia_farma k
USING p
ON k.product_id = p.product_id
WHEN MATCHED AND k.product_name IS NULL
THEN UPDATE SET k.product_name = p.product_name;