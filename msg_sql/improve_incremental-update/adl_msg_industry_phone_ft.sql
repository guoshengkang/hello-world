set mapreduce.job.reduces=1;
ALTER TABLE adl_msg_industry_phone_ft DROP  if exists partition (ds='{p0}');
INSERT INTO adl_msg_industry_phone_ft partition (ds='{p0}')
SELECT 
'{p0}' AS data_date,
msg_industry,
count(distinct mobile_no) AS phone_num
FROM
    (SELECT 
    mobile_no,
    msg_industry,
    sms_num
    FROM idl_msg_receiver_info_agg
    LATERAL VIEW explode(msg_industry_map) mytable AS msg_industry,sms_num
    WHERE ds='{p0}'
    ) t1
WHERE sms_num IS NOT NULL
group by msg_industry;