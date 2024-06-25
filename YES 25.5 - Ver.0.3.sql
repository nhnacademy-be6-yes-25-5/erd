DROP DATABASE IF EXISTS yes_25_5;
CREATE DATABASE yes_25_5;
USE yes_25_5;

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
	`payment_id`	BIGINT	NOT NULL,
	`payment_amount`	INT	NOT NULL,
	`payment_date`	DATETIME	NOT NULL,
	`payment_method`	varchar(10)	NOT NULL,
	`order_id`	BIGINT	NULL,
	`Field`	datetime	NOT NULL
);

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
	`category_id`	BIGINT	NOT NULL PRIMARY KEY,
	`category_name`	VARCHAR(15)	NOT NULL,
	`parent_category_id`	BIGINT	NULL
);

DROP TABLE IF EXISTS `likes`;

CREATE TABLE `likes` (
	`likes_id`	BIGINT	NOT NULL,
	`book_id`	BIGINT	NOT NULL,
	`likes_status`	boolean	NOT NULL,
	`user_id`	bigint	NOT NULL
);

DROP TABLE IF EXISTS `tag`;

CREATE TABLE `tag` (
	`tag_id`	BIGINT	NOT NULL PRIMARY KEY,
	`tag_name`	VARCHAR(15)	NOT NULL
);

DROP TABLE IF EXISTS `coupon`;

CREATE TABLE `coupon` (
	`coupon_id`	BIGINT	NOT NULL PRIMARY KEY,
	`coupon_name`	BIGINT	NOT NULL,
	`coupon_code`	VARCHAR(255)	NOT NULL,
	`coupon_expired_at`	DATE	NOT NULL,
	`coupon_created_at`	date	NOT NULL,
	`coupon_policy_id`	BIGINT	NOT NULL
);

DROP TABLE IF EXISTS `shipping_policy`;

CREATE TABLE `shipping_policy` (
	`shipping_policy_id`	BIGINT	NOT NULL PRIMARY KEY,
	`shipping_policy_fee`	decimal(10,2)	NOT NULL,
	`shipping_policy_min_order_amount`	decimal(10,2)	NOT NULL,
	`shipping_policy_is_member_only`	boolean	NOT NULL
);

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
	`user_id`	bigint	NOT NULL,
	`user_name`	VARCHAR(50)	NOT NULL,
	`user_phone`	VARCHAR(15)	NOT NULL,
	`user_email`	VARCHAR(100)	NOT NULL,
	`user_birth`	DATE	NULL,
	`user_registration_date`	DATETIME	NOT NULL,
	`user_last_login_date`	DATETIME	NULL,
	`provider_id`	bigint	NOT NULL,
	`user_status_id`	bigint	NOT NULL,
	`user_grade_id`	bigint	NOT NULL,
	`user_password`	varchar(255)	NULL
);

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
	`cart_id`	BIGINT	NOT NULL PRIMARY KEY,
	`cart_created_at`	DATE	NOT NULL,
	`user_id`	bigint	NOT NULL
);

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
    `order_id`	BIGINT	NOT NULL PRIMARY KEY,
    `order_date`	DATE	NOT NULL,
    `order_total_amount`	DECIMAL(10,2)	NOT NULL,
    `order_is_takeout`	BOOLEAN	NOT NULL,
    `order_crated_at`	TIMESTAMP	NOT NULL,
    `wrapping_option_id`	BIGINT	NOT NULL,
    `order_status_id`	BIGINT	NOT NULL,
    `address_raw`	varchar(255)	NOT NULL,
    `address_detail`	varchar(255)	NULL,
    `zip_code`	varchar(20)	NOT NULL,
    `order_started_at`	date	NULL,
    `order_delivery_date`	DATE	NOT NULL,
    `order_user_name`	varchar(255)	NOT NULL,
    `order_user_email`	varchar(255)	NOT NULL,
    `order_phone_number`	varchar(255)	NOT NULL,
    `receive_user_name`	varchar(255)	NOT NULL,
    `receive_user_email`	varchar(255)	NOT NULL,
    `receive_phone_number`	varchar(255)	NOT NULL,
    `order_user_id`	bigint	NOT NULL,
    `reference`	varchar(255)	NULL,
    `couponID`	bigint	NULL,
    `point`	decimal(10,2)	NULL
);

DROP TABLE IF EXISTS `point`;

CREATE TABLE `point` (
	`point_id`	BIGINT	NOT NULL PRIMARY KEY,
	`point_current`	decimal(10, 2)	NOT NULL,
	`user_id`	bigint	NOT NULL
);

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
	`book_id`	BIGINT	NOT NULL PRIMARY KEY,
	`book_name`	VARCHAR(30)	NOT NULL,
	`book_index`	VARCHAR(100)	NOT NULL,
	`book_description`	VARCHAR(30)	NOT NULL,
	`book_author`	VARCHAR(20)	NULL,
	`book_publisher`	VARCHAR(255)	NULL,
	`book_publish_date`	DATE	NULL,
	`book_price`	INT	NOT NULL,
	`book_selling_price`	INT	NOT NULL,
	`book_image`	VARCHAR(255)	NULL,
	`quantity`	int	NOT NULL,
	`review_count`	int	NOT NULL,
	`hits_count`	int	NOT NULL,
	`search_count`	int	NULL,
	`book_isbn`	VARCHAR(13)	NOT NULL	COMMENT 'unique'
);

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
	`review_id`	BIGINT	NOT NULL PRIMARY KEY,
	`review_content`	TEXT	NOT NULL,
	`review_photo`	VARCHAR(100)	NULL,
	`review_score`	INT	NOT NULL,
	`review_date`	TIMESTAMP	NOT NULL,
	`order_id`	BIGINT	NOT NULL
);

DROP TABLE IF EXISTS `coupon_policy`;

CREATE TABLE `coupon_policy` (
	`coupon_policy_id`	BIGINT	NOT NULL PRIMARY KEY,
	`coupon_policy_name`	VARCHAR(255)	NOT NULL,
	`coupon_policy_discount_value`	BIGINT	NULL,
	`coupon_policy_created_at`	DATE	NOT NULL,
	`coupon_policy_updated_at`	DATE	NULL,
	`coupon_policy_rate`	int	NULL,
	`coupon_policy_min_order_amount`	decimal(10,2)	NOT NULL,
	`coupon_policy_max_amount`	decimal(10,2)	NULL,
	`coupon_policy_discount_type`	boolean	NOT NULL	COMMENT '0 = rate, 1 = amount'
);

DROP TABLE IF EXISTS `order_product`;

CREATE TABLE `order_product` (
	`order_item_id`	BIGINT	NOT NULL PRIMARY KEY,
	`order_item_quantity`	INT	NOT NULL,
	`order_item_price`	DECIMAL(10,2)	NOT NULL,
	`order_id`	BIGINT	NOT NULL,
	`book_id`	bigint	NOT NULL
);

DROP TABLE IF EXISTS `point_policy`;

CREATE TABLE `point_policy` (
	`point_policy_id`	bigint	NOT NULL PRIMARY KEY,
	`point_policy_name`	bigint	NOT NULL,
	`point_policy_rate`	decimal	NULL,
	`point_policy_condition`	text	NOT NULL,
	`point_policy_redemption_rate`	decimal	NOT NULL,
	`point_policy_created_at`	date	NOT NULL,
	`point_policy_updated_at`	date	NULL,
	`point_policy_apply_type`	boolean	NOT NULL	COMMENT '0 = rate, 1 = amount',
	`point_policy_apply_amount`	decimal	NULL,
	`point_policy_condition_amount`	DECIMAL	NULL
);

DROP TABLE IF EXISTS `takeout`;

CREATE TABLE `takeout` (
	`takeout_id`	BIGINT	NOT NULL PRIMARY KEY,
	`takeout_name`	VARCHAR(50)	NOT NULL,
	`takeout_description`	TEXT	NOT NULL,
	`takeout_price`	DECIMAL(10,2)	NOT NULL,
	`created_at`	TIMESTAMP	NOT NULL,
	`updated_at`	TIMESTAMP	NULL
);

DROP TABLE IF EXISTS `order_status`;

CREATE TABLE `order_status` (
	`order_status_id`	BIGINT	NOT NULL PRIMARY KEY,
	`order_status_name`	varchar(255)	NOT NULL
);

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
	`address_id`	bigint	NOT NULL PRIMARY KEY,
	`address_zip`	varchar(30)	NULL,
	`address_raw`	varchar(255) NOT NULL
);

DROP TABLE IF EXISTS `user_address`;

CREATE TABLE `user_address` (
	`user_address_id`	bigint	NOT NULL,
	`address_id`	bigint	NOT NULL,
	`address_name`	varchar(255)	NULL,
	`address_detail`	varchar(255)	NULL,
	`address_based`	boolean	NOT NULL,
	`user_id`	bigint	NOT NULL
);

DROP TABLE IF EXISTS `provider`;

CREATE TABLE `provider` (
	`provider_id`	bigint	NOT NULL PRIMARY KEY,
	`proivder_name`	varchar(10)	NOT NULL
);

DROP TABLE IF EXISTS `user_grade`;

CREATE TABLE `user_grade` (
	`user_grade_id`	bigint	NOT NULL PRIMARY KEY,
	`user_grade_name`	varchar(10)	NOT NULL,
	`point_policy_id`	bigint	NOT NULL
);

DROP TABLE IF EXISTS `user_status`;

CREATE TABLE `user_status` (
	`user_status_id`	bigint	NOT NULL PRIMARY KEY,
	`user_status_name`	varchar(10)	NULL
);

DROP TABLE IF EXISTS `point_log`;

CREATE TABLE `point_log` (
	`point_log_id`	bigint	NOT NULL,
	`point_log_updated_at`	date	NOT NULL,
	`point_log_used`	varchar(20)	NOT NULL,
	`point_log_updated_type`	varchar(20)	NOT NULL,
	`point_log_amount`	decimal(10, 2)	NOT NULL,
	`point_id`	BIGINT	NOT NULL
);

DROP TABLE IF EXISTS `refund`;

CREATE TABLE `refund` (
	`refund_id`	bigint	NOT NULL,
	`order_id`	BIGINT	NOT NULL,
	`refund_policy_id`	bigint	NOT NULL
);

DROP TABLE IF EXISTS `refund_policy`;

CREATE TABLE `refund_policy` (
	`refund_policy_id`	bigint	NOT NULL PRIMARY KEY,
	`refund_policy_name`	varchar(255)	NOT NULL,
	`refund_policy_date`	date	NOT NULL
);

DROP TABLE IF EXISTS `book_tag`;

CREATE TABLE `book_tag` (
	`book_tag_Id`	bigint	NOT NULL,
	`book_id`	BIGINT	NOT NULL,
	`tag_id`	BIGINT	NOT NULL
);

DROP TABLE IF EXISTS `book_category`;

CREATE TABLE `book_category` (
	`book_category_id`	bigint	NOT NULL PRIMARY KEY,
	`book_id`	BIGINT	NOT NULL,
	`category_id2`	BIGINT	NOT NULL
);

DROP TABLE IF EXISTS `cart_book`;

CREATE TABLE `cart_book` (
	`cart_book_id`	bigint	NOT NULL,
	`cart_id`	BIGINT	NOT NULL,
	`book_id2`	BIGINT	NOT NULL,
	`book_qunatity`	int	NOT NULL,
	`user_id2`	bigint	NOT NULL
);

DROP TABLE IF EXISTS `coupon_policy_tag`;

CREATE TABLE `coupon_policy_tag` (
	`coupon_policy_tag_id`	bigint	NOT NULL,
	`coupon_policy_id`	BIGINT	NOT NULL,
	`tag_id`	BIGINT	NOT NULL
);

DROP TABLE IF EXISTS `coupon_tag_category`;

CREATE TABLE `coupon_tag_category` (
	`coupon_policy_category_id`	bigint	NOT NULL,
	`coupon_policy_id`	BIGINT	NOT NULL,
	`category_id`	BIGINT	NOT NULL
);

DROP TABLE IF EXISTS `coupon_policy_book`;

CREATE TABLE `coupon_policy_book` (
	`coupon_policy_book`	bigint	NOT NULL,
	`coupon_policy_id`	BIGINT	NOT NULL,
	`book_id`	BIGINT	NOT NULL
);

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
	`user_id`	bigint	NOT NULL PRIMARY KEY,
	`user_role`	varchar(10)	NOT NULL
);

DROP TABLE IF EXISTS `coupon_user`;

CREATE TABLE `coupon_user` (
	`user_coupon_id`	BIGINT	NOT NULL,
	`user_coupon_used_at`	DATE	NULL,
	`user_coupon_status`	ENUM('active', 'used', 'expired')	NOT NULL,
	`user_coupon_type`	VARCHAR(255)	NOT NULL	COMMENT 'ex) 생일, 웰컴',
	`user_id`	bigint	NOT NULL,
	`coupon_id`	BIGINT	NOT NULL
);

DROP TABLE IF EXISTS `user_total_amount`;

CREATE TABLE `user_total_amount` (
	`user_total_amount_id`	BIGINT	NOT NULL,
	`user_total_amount`	DECIMAL	NOT NULL,
	`user_id`	bigint	NOT NULL
);

DROP TABLE IF EXISTS `book_author`;

CREATE TABLE `book_author` (
	`book_author_id`	BIGINT	NOT NULL,
	`book_id`	BIGINT	NOT NULL,
	`author_id2`	BIGINT	NOT NULL
);

DROP TABLE IF EXISTS `author`;

CREATE TABLE `author` (
	`author_id`	BIGINT	NOT NULL PRIMARY KEY,
	`author_name`	VARCHAR(255)	NOT NULL
);

DROP TABLE IF EXISTS `review_photo`;

CREATE TABLE `review_photo` (
	`review_photo_id`	bigint	NOT NULL,
	`review_photo_url`	varchar(255)	NOT NULL,
	`review_id`	BIGINT	NOT NULL
);

ALTER TABLE `user` ADD CONSTRAINT `FK_user_TO_customer_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `customer` (
	`user_id`
);

ALTER TABLE `payment` ADD CONSTRAINT `FK_orders_TO_payment_1` FOREIGN KEY (
	`order_id`
)
REFERENCES `orders` (
	`order_id`
);

ALTER TABLE `category` ADD CONSTRAINT `FK_category_TO_category_1` FOREIGN KEY (
	`parent_category_id`
)
REFERENCES `category` (
	`category_id`
);

ALTER TABLE `likes` ADD CONSTRAINT `FK_book_TO_likes_1` FOREIGN KEY (
	`book_id`
)
REFERENCES `book` (
	`book_id`
);

ALTER TABLE `likes` ADD CONSTRAINT `FK_user_TO_likes_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `coupon` ADD CONSTRAINT `FK_coupon_policy_TO_coupon_1` FOREIGN KEY (
	`coupon_policy_id`
)
REFERENCES `coupon_policy` (
	`coupon_policy_id`
);

ALTER TABLE `user` ADD CONSTRAINT `FK_provider_TO_user_1` FOREIGN KEY (
	`provider_id`
)
REFERENCES `provider` (
	`provider_id`
);

ALTER TABLE `user` ADD CONSTRAINT `FK_user_status_TO_user_1` FOREIGN KEY (
	`user_status_id`
)
REFERENCES `user_status` (
	`user_status_id`
);

ALTER TABLE `user` ADD CONSTRAINT `FK_user_grade_TO_user_1` FOREIGN KEY (
	`user_grade_id`
)
REFERENCES `user_grade` (
	`user_grade_id`
);

ALTER TABLE `cart` ADD CONSTRAINT `FK_user_TO_cart_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `orders` ADD CONSTRAINT `FK_takeout_TO_orders_1` FOREIGN KEY (
	`wrapping_option_id`
)
REFERENCES `takeout` (
	`takeout_id`
);

ALTER TABLE `orders` ADD CONSTRAINT `FK_order_status_TO_orders_1` FOREIGN KEY (
	`order_status_id`
)REFERENCES `order_status` (
	`order_status_id`
);

ALTER TABLE `point` ADD CONSTRAINT `FK_user_TO_point_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `review` ADD CONSTRAINT `FK_orders_TO_review_1` FOREIGN KEY (
	`order_id`
)
REFERENCES `orders` (
	`order_id`
);

ALTER TABLE `order_product` ADD CONSTRAINT `FK_orders_TO_order_product_1` FOREIGN KEY (
	`order_id`
)
REFERENCES `orders` (
	`order_id`
);

ALTER TABLE `user_address` ADD CONSTRAINT `FK_address_TO_user_address_1` FOREIGN KEY (
	`address_id`
)
REFERENCES `address` (
	`address_id`
);

ALTER TABLE `user_address` ADD CONSTRAINT `FK_user_TO_user_address_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `user_grade` ADD CONSTRAINT `FK_point_policy_TO_user_grade_1` FOREIGN KEY (
	`point_policy_id`
)
REFERENCES `point_policy` (
	`point_policy_id`
);

ALTER TABLE `point_log` ADD CONSTRAINT `FK_point_TO_point_log_1` FOREIGN KEY (
	`point_id`
)
REFERENCES `point` (
	`point_id`
);

ALTER TABLE `refund` ADD CONSTRAINT `FK_orders_TO_refund_1` FOREIGN KEY (
	`order_id`
)
REFERENCES `orders` (
	`order_id`
);

ALTER TABLE `refund` ADD CONSTRAINT `FK_refund_policy_TO_refund_1` FOREIGN KEY (
	`refund_policy_id`
)
REFERENCES `refund_policy` (
	`refund_policy_id`
);

ALTER TABLE `book_tag` ADD CONSTRAINT `FK_book_TO_book_tag_1` FOREIGN KEY (
	`book_id`
)
REFERENCES `book` (
	`book_id`
);

ALTER TABLE `book_tag` ADD CONSTRAINT `FK_tag_TO_book_tag_1` FOREIGN KEY (
	`tag_id`
)
REFERENCES `tag` (
	`tag_id`
);

ALTER TABLE `book_category` ADD CONSTRAINT `FK_book_TO_book_category_1` FOREIGN KEY (
	`book_id`
)
REFERENCES `book` (
	`book_id`
);

ALTER TABLE `book_category` ADD CONSTRAINT `FK_category_TO_book_category_1` FOREIGN KEY (
	`category_id2`
)
REFERENCES `category` (
	`category_id`
);

ALTER TABLE `cart_book` ADD CONSTRAINT `FK_cart_TO_cart_book_1` FOREIGN KEY (
	`cart_id`
)
REFERENCES `cart` (
	`cart_id`
);

ALTER TABLE `cart_book` ADD CONSTRAINT `FK_cart_TO_cart_book_2` FOREIGN KEY (
	`user_id2`
)
REFERENCES `cart` (
	`user_id`
);

ALTER TABLE `cart_book` ADD CONSTRAINT `FK_book_TO_cart_book_1` FOREIGN KEY (
	`book_id2`
)
REFERENCES `book` (
	`book_id`
);

ALTER TABLE `coupon_policy_tag` ADD CONSTRAINT `FK_coupon_policy_TO_coupon_policy_tag_1` FOREIGN KEY (
	`coupon_policy_id`
)
REFERENCES `coupon_policy` (
	`coupon_policy_id`
);

ALTER TABLE `coupon_tag_category` ADD CONSTRAINT `FK_coupon_policy_TO_coupon_tag_category_1` FOREIGN KEY (
	`coupon_policy_id`
)
REFERENCES `coupon_policy` (
	`coupon_policy_id`
);

ALTER TABLE `coupon_policy_book` ADD CONSTRAINT `FK_coupon_policy_TO_coupon_policy_book_1` FOREIGN KEY (
	`coupon_policy_id`
)
REFERENCES `coupon_policy` (
	`coupon_policy_id`
);

ALTER TABLE `coupon_user` ADD CONSTRAINT `FK_user_TO_coupon_user_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `user_total_amount` ADD CONSTRAINT `FK_user_TO_user_total_amount_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `book_author` ADD CONSTRAINT `FK_book_TO_book_author_1` FOREIGN KEY (
	`book_id`
)
REFERENCES `book` (
	`book_id`
);

ALTER TABLE `book_author` ADD CONSTRAINT `FK_author_TO_book_author_1` FOREIGN KEY (
	`author_id2`
)
REFERENCES `author` (
	`author_id`
);

ALTER TABLE `review_photo` ADD CONSTRAINT `FK_review_TO_review_photo_1` FOREIGN KEY (
	`review_id`
)
REFERENCES `review` (
	`review_id`
);
