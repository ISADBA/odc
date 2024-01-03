--
--  v2.0.0
--
CREATE TABLE IF NOT EXISTS `odc_sql_script` (
 `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
 `user_id` INT(11) DEFAULT NULL,
 `script_name` VARCHAR(128) DEFAULT NULL,
 `script_text` TEXT DEFAULT NULL,
 `gmt_create` TIMESTAMP NULL DEFAULT NULL,
 `gmt_modify` TIMESTAMP NULL DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS `odc_user_info` (
 `id` INT(11) NOT NULL AUTO_INCREMENT,
 `name` VARCHAR(64) DEFAULT NULL,
 `email` VARCHAR(128) DEFAULT NULL,
 `password` VARCHAR(128) DEFAULT NULL,
 `role` VARCHAR(32) DEFAULT NULL,
 `status` INT(11) DEFAULT '1',
 `desc` VARCHAR(512) DEFAULT NULL,
 `gmt_create` TIMESTAMP NULL DEFAULT NULL,
 `gmt_modify` TIMESTAMP NULL DEFAULT NULL,
 PRIMARY KEY (`id`),
 KEY(`email`)
);

CREATE TABLE IF NOT EXISTS `odc_configuration` (
 `key` VARCHAR(64) NOT NULL,
 `value` VARCHAR(1280) DEFAULT NULL,
 `createTime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
 `modifyTime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 `cname` VARCHAR(64) DEFAULT '',
 `help` VARCHAR(10240) DEFAULT NULL,
 PRIMARY KEY (`key`)
);


CREATE TABLE IF NOT EXISTS `odc_session_manager` (
 `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
 `user_id` INT(11) DEFAULT NULL,
 `session_name` VARCHAR(64) DEFAULT NULL,
 `db_mode` VARCHAR(64) DEFAULT NULL,
 `host` VARCHAR(64) DEFAULT NULL,
 `port` VARCHAR(32) DEFAULT NULL,
 `cluster` VARCHAR(32) DEFAULT NULL,
 `tenant` VARCHAR(32) DEFAULT NULL,
 `db_user` VARCHAR(32) DEFAULT NULL,
 `password` VARCHAR(64) DEFAULT NULL,
 `config_url` VARCHAR(256) DEFAULT NULL,
 `default_DBName` VARCHAR(64) DEFAULT NULL,
 `gmt_create` TIMESTAMP NULL DEFAULT NULL,
 `gmt_modify` TIMESTAMP NULL DEFAULT NULL
);


CREATE TABLE IF NOT EXISTS `odc_version_diff_config` (
 `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
 `config_key` VARCHAR(64) DEFAULT NULL,
 `db_mode` VARCHAR(32) DEFAULT NULL,
 `config_value` VARCHAR(2048) DEFAULT NULL,
 `min_version` VARCHAR(64) DEFAULT NULL,
 `gmt_create` TIMESTAMP NULL DEFAULT NULL,
 `gmt_modify` TIMESTAMP NULL DEFAULT NULL
);
