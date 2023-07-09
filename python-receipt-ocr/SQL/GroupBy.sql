-- Group by time and select amount ...
-- https://docs.timescale.com/api/latest/hyperfunctions/time_bucket/?ref=timescale.com
Select 
    time_bucket(interval '1 day', time) as day,
    sum(amount),
    description,
    merchant_address
from receipts
group by day, description, merchant_address
order by day
     