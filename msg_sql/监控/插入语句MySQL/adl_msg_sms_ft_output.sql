INSERT INTO datacenter.jobs (
	jdid,
	import_hdfs,
	hadoop_host,
	STATUS,
	created
)
VALUES
	(
		30,
		'/user/hive/warehouse/leesdata.db/adl_msg_sms_ft/ds={p0}/',
		'hdfs://172.31.6.206:8020',
		0,
		NOW()
	);