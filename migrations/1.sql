CREATE TABLE IF NOT EXISTS `configs` (
    `name` varchar(64) PRIMARY KEY NOT NULL,
    `backend_url` varchar(255) NOT NULL,
    `port` int DEFAULT 8080,
    `heartbeat_max_time` int DEFAULT 120.0,
    `pokemon_max_time` int DEFAULT 45.0,
    `raid_max_time` int DEFAULT 25.0,
    `startup_lat` double DEFAULT 0.0,
    `startup_lon` double DEFAULT 0.0,
    `token` varchar(255) DEFAULT NULL,
    `jitter_value` double DEFAULT 0.00005,
    `max_warning_time_raid` int DEFAULT 432000,
    `encounter_delay` int DEFAULT 0,
    `min_delay_logout` int DEFAULT 120,
    `max_empty_gmo` int DEFAULT 50,
    `max_failed_count` int DEFAULT 5,
    `max_no_quest_count` int DEFAULT 5,
    `logging_url` varchar(255) DEFAULT NULL,
    `logging_port` int DEFAULT 8432,
    `logging_tls` tinyint(1) DEFAULT 0,
    `logging_tcp` tinyint(1) DEFAULT 1,
    `account_manager` tinyint(1) DEFAULT 1,
    `deploy_eggs` tinyint(1) DEFAULT 1,
    `nearby_tracker` tinyint(1) DEFAULT 1,
    `auto_login` tinyint(1) DEFAULT 1,
    `ultra_iv` tinyint(1) DEFAULT 1,
    `ultra_quests` tinyint(1) DEFAULT 1,
    `is_default` tinyint(1) DEFAULT 0
);

CREATE TABLE IF NOT EXISTS `devices` (
    `uuid` varchar(128) PRIMARY KEY NOT NULL,
    `config` varchar(64) DEFAULT NULL,
    `last_seen` int DEFAULT NULL,
    CONSTRAINT `fk_config_name`
        FOREIGN KEY (`config`)
        REFERENCES `configs` (`name`)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);
