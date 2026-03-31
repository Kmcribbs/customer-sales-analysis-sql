SELECT * FROM CHANNEL;

SELECT ChannelName FROM CHANNEL;

SELECT ChannelName, ChannelCommission
FROM CHANNEL
ORDER BY ChannelCommission DESC;

SELECT ChannelName, ChannelCommission
FROM CHANNEL
WHERE ChannelCommission > 0.1;

SELECT StayID, StayPrice * (1 - StayDiscount) AS 'Actual Price'
FROM
STAY;

SELECT
    StayID,
    ROUND(StayPrice * (1 - StayDiscount), 2) AS 'Actual Price Rounded'
FROM
    STAY;

    SELECT
    *
FROM
    OWNER
WHERE
    (OwnerJoinDate >= DATE_ADD(CURDATE(), INTERVAL - 1 YEAR))
        AND OwnerEndDate IS NULL;

SELECT
    OwnerEmail,
    DATE_ADD(OwnerEndDate, INTERVAL 1 WEEK) AS NotificationDate,
    LAST_DAY(OwnerEndDate) AS FinancialClosure
FROM
    OWNER
WHERE
    OwnerEndDate IS NOT NULL;
