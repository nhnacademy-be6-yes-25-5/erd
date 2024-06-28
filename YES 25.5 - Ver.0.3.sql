DROP DATABASE IF EXISTS yes_25_5;
CREATE DATABASE yes_25_5;
USE yes_25_5;

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
	`payment_id`	BIGINT	NOT NULL,
	`payment_amount`	INT	NOT NULL,
	`payment_date`	DATETIME	NOT NULL,
	`payment_method`	varchar(10)	NOT NULL,
	`Field`	datetime	NOT NULL,
	`fake_order_id`	BIGINT	NOT NULL
);

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
	`category_id`	BIGINT	NOT NULL,
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
	`tag_id`	BIGINT	NOT NULL,
	`tag_name`	VARCHAR(15)	NOT NULL
);

DROP TABLE IF EXISTS `coupon`;

CREATE TABLE `coupon` (
	`coupon_id`	BIGINT	NOT NULL,
	`coupon_name`	BIGINT	NOT NULL,
	`coupon_code`	VARCHAR(255)	NOT NULL,
	`coupon_expired_at`	DATE	NOT NULL,
	`coupon_created_at`	date	NOT NULL,
	`coupon_policy_id`	BIGINT	NOT NULL
);

DROP TABLE IF EXISTS `shipping_policy`;

CREATE TABLE `shipping_policy` (
	`shipping_policy_id`	BIGINT	NOT NULL,
	`shipping_policy_fee`	decimal(10,2)	NOT NULL,
	`shipping_policy_min_order_amount`	decimal(10,2)	NOT NULL,
	`shipping_policy_is_member_only`	boolean	NOT NULL
);

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
	`user_id`	BIGINT	NOT NULL,
	`user_name`	VARCHAR(50)	NOT NULL,
	`user_phone`	VARCHAR(15)	NOT NULL,
	`user_email`	VARCHAR(100)	NOT NULL,
	`user_birth`	DATE	NULL,
	`user_registration_date`	DATETIME	NOT NULL,
	`user_last_login_date`	DATETIME	NULL,
	`provider_id`	BIGINT	NOT NULL,
	`user_status_id`	BIGINT	NOT NULL,
	`user_grade_id`	BIGINT	NOT NULL,
	`user_password`	varchar(255)	NULL
);

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
	`cart_id`	BIGINT	NOT NULL,
	`cart_created_at`	DATE	NOT NULL,
	`user_id`	bigint	NOT NULL
);

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
	`order_id`	BIGINT	NOT NULL,
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
	`point_id`	BIGINT	NOT NULL,
	`point_current`	decimal(10, 2)	NOT NULL,
	`user_id`	bigint	NOT NULL
);

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
	`book_id`	BIGINT	NOT NULL,
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
	`review_id`	BIGINT	NOT NULL,
	`review_content`	TEXT	NOT NULL,
	`review_photo`	VARCHAR(100)	NULL,
	`review_score`	INT	NOT NULL,
	`review_date`	TIMESTAMP	NOT NULL,
	`order_id`	BIGINT	NOT NULL
);

DROP TABLE IF EXISTS `coupon_policy`;

CREATE TABLE `coupon_policy` (
	`coupon_policy_id`	BIGINT	NOT NULL,
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
	`order_item_id`	BIGINT	NOT NULL,
	`order_item_quantity`	INT	NOT NULL,
	`order_item_price`	DECIMAL(10,2)	NOT NULL,
	`order_id`	BIGINT	NOT NULL,
	`book_id`	bigint	NOT NULL
);

DROP TABLE IF EXISTS `point_policy`;

CREATE TABLE `point_policy` (
	`point_policy_id`	bigint	NOT NULL,
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
	`takeout_id`	BIGINT	NOT NULL,
	`takeout_name`	VARCHAR(50)	NOT NULL,
	`takeout_description`	TEXT	NOT NULL,
	`takeout_price`	DECIMAL(10,2)	NOT NULL,
	`created_at`	TIMESTAMP	NOT NULL,
	`updated_at`	TIMESTAMP	NULL
);

DROP TABLE IF EXISTS `order_status`;

CREATE TABLE `order_status` (
	`order_status_id`	BIGINT	NOT NULL,
	`order_status_name`	varchar(255)	NOT NULL
);

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
	`address_id`	bigint	NOT NULL,
	`address_zip`	varchar(30)	NULL,
	`address_raw`	varchar(255)	NOT NULL
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
	`provider_id`	bigint	NOT NULL,
	`proivder_name`	varchar(10)	NOT NULL
);

DROP TABLE IF EXISTS `user_grade`;

CREATE TABLE `user_grade` (
	`user_grade_id`	BIGINT	NOT NULL,
	`user_grade_name`	varchar(10)	NOT NULL,
	`point_policy_id`	BIGINT	NOT NULL
);

DROP TABLE IF EXISTS `user_status`;

CREATE TABLE `user_status` (
	`user_status_id`	bigint	NOT NULL,
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
	`refund_policy_id`	bigint	NOT NULL,
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
	`book_category_id`	bigint	NOT NULL,
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
	`category_id`	BIGINT	NOT NULL,
    `category_name`	varchar(255) NOT NULL
);

DROP TABLE IF EXISTS `coupon_policy_book`;

CREATE TABLE `coupon_policy_book` (
	`coupon_policy_book`	bigint	NOT NULL,
	`coupon_policy_id`	BIGINT	NOT NULL,
	`book_id`	BIGINT	NOT NULL,
    `book_name`	varchar(255) NOT NULL
);

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
	`user_id`	bigint	NOT NULL,
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
	`author_id`	BIGINT	NOT NULL,
	`author_name`	VARCHAR(255)	NOT NULL
);

DROP TABLE IF EXISTS `review_photo`;

CREATE TABLE `review_photo` (
	`review_photo_id`	bigint	NOT NULL,
	`review_photo_url`	varchar(255)	NOT NULL,
	`review_id`	BIGINT	NOT NULL
);

DROP TABLE IF EXISTS `user_grade_log`;

CREATE TABLE `user_grade_log` (
	`user_grade_log_id`	BIGINT	NOT NULL,
	`user_grade_updated_at`	TIMESTAMP	NOT NULL,
	`user_grade_id`	BIGINT	NOT NULL,
	`user_id`	BIGINT	NOT NULL
);

ALTER TABLE `payment` ADD CONSTRAINT `PK_PAYMENT` PRIMARY KEY (
	`payment_id`
);

ALTER TABLE `category` ADD CONSTRAINT `PK_CATEGORY` PRIMARY KEY (
	`category_id`
);

ALTER TABLE `likes` ADD CONSTRAINT `PK_LIKES` PRIMARY KEY (
	`likes_id`
);

ALTER TABLE `tag` ADD CONSTRAINT `PK_TAG` PRIMARY KEY (
	`tag_id`
);

ALTER TABLE `coupon` ADD CONSTRAINT `PK_COUPON` PRIMARY KEY (
	`coupon_id`
);

ALTER TABLE `shipping_policy` ADD CONSTRAINT `PK_SHIPPING_POLICY` PRIMARY KEY (
	`shipping_policy_id`
);

ALTER TABLE `user` ADD CONSTRAINT `PK_USER` PRIMARY KEY (
	`user_id`
);

ALTER TABLE `cart` ADD CONSTRAINT `PK_CART` PRIMARY KEY (
	`cart_id`
);

ALTER TABLE `orders` ADD CONSTRAINT `PK_ORDERS` PRIMARY KEY (
	`order_id`
);

ALTER TABLE `point` ADD CONSTRAINT `PK_POINT` PRIMARY KEY (
	`point_id`
);

ALTER TABLE `book` ADD CONSTRAINT `PK_BOOK` PRIMARY KEY (
	`book_id`
);

ALTER TABLE `review` ADD CONSTRAINT `PK_REVIEW` PRIMARY KEY (
	`review_id`
);

ALTER TABLE `coupon_policy` ADD CONSTRAINT `PK_COUPON_POLICY` PRIMARY KEY (
	`coupon_policy_id`
);

ALTER TABLE `order_product` ADD CONSTRAINT `PK_ORDER_PRODUCT` PRIMARY KEY (
	`order_item_id`
);

ALTER TABLE `point_policy` ADD CONSTRAINT `PK_POINT_POLICY` PRIMARY KEY (
	`point_policy_id`
);

ALTER TABLE `takeout` ADD CONSTRAINT `PK_TAKEOUT` PRIMARY KEY (
	`takeout_id`
);

ALTER TABLE `order_status` ADD CONSTRAINT `PK_ORDER_STATUS` PRIMARY KEY (
	`order_status_id`
);

ALTER TABLE `address` ADD CONSTRAINT `PK_ADDRESS` PRIMARY KEY (
	`address_id`
);

ALTER TABLE `user_address` ADD CONSTRAINT `PK_USER_ADDRESS` PRIMARY KEY (
	`user_address_id`
);

ALTER TABLE `provider` ADD CONSTRAINT `PK_PROVIDER` PRIMARY KEY (
	`provider_id`
);

ALTER TABLE `user_grade` ADD CONSTRAINT `PK_USER_GRADE` PRIMARY KEY (
	`user_grade_id`
);

ALTER TABLE `user_status` ADD CONSTRAINT `PK_USER_STATUS` PRIMARY KEY (
	`user_status_id`
);

ALTER TABLE `point_log` ADD CONSTRAINT `PK_POINT_LOG` PRIMARY KEY (
	`point_log_id`
);

ALTER TABLE `refund` ADD CONSTRAINT `PK_REFUND` PRIMARY KEY (
	`refund_id`
);

ALTER TABLE `refund_policy` ADD CONSTRAINT `PK_REFUND_POLICY` PRIMARY KEY (
	`refund_policy_id`
);

ALTER TABLE `book_tag` ADD CONSTRAINT `PK_BOOK_TAG` PRIMARY KEY (
	`book_tag_Id`
);

ALTER TABLE `book_category` ADD CONSTRAINT `PK_BOOK_CATEGORY` PRIMARY KEY (
	`book_category_id`
);

ALTER TABLE `cart_book` ADD CONSTRAINT `PK_CART_BOOK` PRIMARY KEY (
	`cart_book_id`
);

ALTER TABLE `coupon_policy_tag` ADD CONSTRAINT `PK_COUPON_POLICY_TAG` PRIMARY KEY (
	`coupon_policy_tag_id`
);

ALTER TABLE `coupon_tag_category` ADD CONSTRAINT `PK_COUPON_TAG_CATEGORY` PRIMARY KEY (
	`coupon_policy_category_id`
);

ALTER TABLE `coupon_policy_book` ADD CONSTRAINT `PK_COUPON_POLICY_BOOK` PRIMARY KEY (
	`coupon_policy_book`
);

ALTER TABLE `customer` ADD CONSTRAINT `PK_CUSTOMER` PRIMARY KEY (
	`user_id`
);

ALTER TABLE `coupon_user` ADD CONSTRAINT `PK_COUPON_USER` PRIMARY KEY (
	`user_coupon_id`
);

ALTER TABLE `user_total_amount` ADD CONSTRAINT `PK_USER_TOTAL_AMOUNT` PRIMARY KEY (
	`user_total_amount_id`
);

ALTER TABLE `book_author` ADD CONSTRAINT `PK_BOOK_AUTHOR` PRIMARY KEY (
	`book_author_id`
);

ALTER TABLE `author` ADD CONSTRAINT `PK_AUTHOR` PRIMARY KEY (
	`author_id`
);

ALTER TABLE `review_photo` ADD CONSTRAINT `PK_REVIEW_PHOTO` PRIMARY KEY (
	`review_photo_id`
);

ALTER TABLE `user_grade_log` ADD CONSTRAINT `PK_USER_GRADE_LOG` PRIMARY KEY (
	`user_grade_log_id`
);

ALTER TABLE `user` ADD CONSTRAINT `FK_customer_TO_user_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `customer` (
	`user_id`
);