-- Retrieve all data from CHANNEL table
SELECT *
FROM CHANNEL;

-- Retrieve all channel names
SELECT ChannelName
FROM CHANNEL;

-- Get channels ordered by highest commission
SELECT ChannelName, ChannelCommission
FROM CHANNEL
ORDER BY ChannelCommission DESC;

-- Filter channels with commission greater than 0.1
SELECT ChannelName, ChannelCommission
FROM CHANNEL
WHERE ChannelCommission > 0.1;

-- Calculate actual stay price after discount
SELECT StayID, StayPrice * (1 - StayDiscount) AS ActualPrice
FROM STAY;

-- Calculate rounded stay price after discount
SELECT StayID,
ROUND(StayPrice * (1 - StayDiscount), 2) AS ActualPriceRounded
FROM STAY;

-- Find active owners who joined within the last year
SELECT *
FROM OWNER
WHERE OwnerJoinDate >= DATE_ADD(CURDATE(), INTERVAL -1 YEAR)
AND OwnerEndDate IS NULL;

-- Calculate notification and financial closure dates
SELECT OwnerEmail,
DATE_ADD(OwnerEndDate, INTERVAL 1 WEEK) AS NotificationDate,
LAST_DAY(OwnerEndDate) AS FinancialClosure
FROM OWNER
WHERE OwnerEndDate IS NOT NULL;
