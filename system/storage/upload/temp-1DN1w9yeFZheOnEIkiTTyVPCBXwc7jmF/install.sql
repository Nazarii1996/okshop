RENAME TABLE `oc_ocfilter_option` TO `oc_ocfilter_option_temp`;

CREATE TABLE IF NOT EXISTS `oc_ocfilter_option` (
  `option_id` INT(11) NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(16) NOT NULL DEFAULT 'checkbox',
  `keyword` VARCHAR(255) NOT NULL DEFAULT '',
  `selectbox` TINYINT(1) NOT NULL DEFAULT '0',
  `grouping` TINYINT(2) NOT NULL DEFAULT '0',
  `color` TINYINT(1) NOT NULL DEFAULT '0',
  `image` TINYINT(1) NOT NULL DEFAULT '0',
  `status` TINYINT(1) NOT NULL DEFAULT '1',
  `sort_order` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`option_id`),
  KEY `keyword` (`keyword`),
  KEY `sort_order` (`sort_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT IGNORE INTO `oc_ocfilter_option` (`option_id`, `type`, `keyword`, `selectbox`, `grouping`, `color`, `image`, `status`, `sort_order`) SELECT `option_id`, `type`, `keyword`, `selectbox`, `grouping`, `color`, `image`, `status`, `sort_order` FROM `oc_ocfilter_option_temp`;

DROP TABLE IF EXISTS `oc_ocfilter_option_temp`;

/*------------------------------------------------------------------------------------------------------*/
RENAME TABLE `oc_ocfilter_option_value` TO `oc_ocfilter_option_value_temp`;

CREATE TABLE IF NOT EXISTS `oc_ocfilter_option_value` (
  `value_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `option_id` INT(11) NOT NULL DEFAULT '0',
  `keyword` VARCHAR(255) NOT NULL DEFAULT '',
  `color` VARCHAR(6) NOT NULL DEFAULT '',
  `image` VARCHAR(255) NOT NULL DEFAULT '',
  `sort_order` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`value_id`),
  KEY `option_id` (`option_id`),
  KEY `keyword` (`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT IGNORE INTO `oc_ocfilter_option_value` (`value_id`, `option_id`, `keyword`, `color`, `image`, `sort_order`) SELECT `value_id`, `option_id`, `keyword`, `color`, `image`, `sort_order` FROM `oc_ocfilter_option_value_temp`;

DROP TABLE IF EXISTS `oc_ocfilter_option_value_temp`;

/*------------------------------------------------------------------------------------------------------*/
RENAME TABLE `oc_ocfilter_option_value_description` TO `oc_ocfilter_option_value_description_temp`;

CREATE TABLE IF NOT EXISTS `oc_ocfilter_option_value_description` (
  `value_id` BIGINT(20) NOT NULL,
  `option_id` INT(11) NOT NULL,
  `language_id` TINYINT(2) NOT NULL,
  `name` VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`,`language_id`),
  KEY `option_id` (`option_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT IGNORE INTO `oc_ocfilter_option_value_description` (`value_id`, `option_id`, `language_id`, `name`) SELECT `value_id`, `option_id`, `language_id`, `name` FROM `oc_ocfilter_option_value_description_temp`;

DROP TABLE IF EXISTS `oc_ocfilter_option_value_description_temp`;

/*------------------------------------------------------------------------------------------------------*/
RENAME TABLE `oc_ocfilter_option_value_to_product` TO `oc_ocfilter_option_value_to_product_temp`;

CREATE TABLE IF NOT EXISTS `oc_ocfilter_option_value_to_product` (
	`ocfilter_option_value_to_product_id` INT(11) NOT NULL AUTO_INCREMENT,
	`product_id` INT(11) NOT NULL,
	`option_id` INT(11) NOT NULL,
	`value_id` BIGINT(20) NOT NULL,
	`slide_value_min` DECIMAL(15,4) NOT NULL DEFAULT '0.0000',
	`slide_value_max` DECIMAL(15,4) NOT NULL DEFAULT '0.0000',
	PRIMARY KEY (`ocfilter_option_value_to_product_id`),
  UNIQUE INDEX `option_id_value_id_product_id` (`option_id`, `value_id`, `product_id`),
	INDEX `slide_value_min_slide_value_max` (`slide_value_min`, `slide_value_max`),
	INDEX `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT IGNORE INTO `oc_ocfilter_option_value_to_product` (`product_id`, `option_id`, `value_id`, `slide_value_min`, `slide_value_max`) SELECT `product_id`, `option_id`, `value_id`, `slide_value_min`, `slide_value_max` FROM `oc_ocfilter_option_value_to_product_temp`;

DROP TABLE IF EXISTS `oc_ocfilter_option_value_to_product_temp`;

/*------------------------------------------------------------------------------------------------------*/
RENAME TABLE `oc_ocfilter_page` TO `oc_ocfilter_page_temp`;

CREATE TABLE IF NOT EXISTS `oc_ocfilter_page` (
	`ocfilter_page_id` INT(11) NOT NULL AUTO_INCREMENT,
	`category_id` INT(11) NOT NULL DEFAULT '0',
	`keyword` VARCHAR(255) NOT NULL,
	`params` VARCHAR(255) NOT NULL,
	`over` SET('domain','category') NOT NULL DEFAULT 'category',
	`status` TINYINT(1) NOT NULL DEFAULT '1',
	PRIMARY KEY (`ocfilter_page_id`),
	INDEX `keyword` (`keyword`),
	INDEX `category_id_params` (`category_id`, `params`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT IGNORE INTO `oc_ocfilter_page` (`ocfilter_page_id`, `category_id`, `keyword`, `params`, `status`) SELECT `ocfilter_page_id`, `category_id`, `keyword`, `ocfilter_params`, `status` FROM `oc_ocfilter_page_temp`;

CREATE TABLE IF NOT EXISTS `oc_ocfilter_page_description` (
	`ocfilter_page_id` INT(11) NOT NULL DEFAULT '0',
	`language_id` INT(11) NOT NULL DEFAULT '0',
	`meta_title` VARCHAR(255) NOT NULL,
	`meta_keyword` VARCHAR(255) NOT NULL,
	`meta_description` VARCHAR(255) NOT NULL,
	`description` TEXT NOT NULL,
	`title` VARCHAR(128) NOT NULL,
	PRIMARY KEY (`ocfilter_page_id`, `language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT IGNORE INTO `oc_ocfilter_page_description` (
  `ocfilter_page_id`,
  `language_id`,
  `meta_title`,
  `meta_keyword`,
  `meta_description`,
  `description`,
  `title`
) SELECT
  result.`ocfilter_page_id`,
  l.`language_id`,
  result.`meta_title`,
  result.`meta_keyword`,
  result.`meta_description`,
  result.`description`,
  result.`title`
FROM (SELECT * FROM `oc_ocfilter_page_temp`) result, `oc_language` l GROUP BY result.`ocfilter_page_id`, l.`language_id`;

DROP TABLE IF EXISTS `oc_ocfilter_page_temp`;