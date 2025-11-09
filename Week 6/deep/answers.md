# From the Deep

## Random Partitioning

Boats will be equally loaded. Data will be randomly spreaded so the researcher will need to run the query on all of the boats.

## Partitioning by Hour

This kind of partitioning will overload some of the boats and some boats will be empty. But this method make queries quicker because the date will be already sorted.

## Partitioning by Hash Value

Data will be stored evenly. Because the data will be sorted it would be quicker to find specific data by hash. But it will be slower to find data by specific time.
