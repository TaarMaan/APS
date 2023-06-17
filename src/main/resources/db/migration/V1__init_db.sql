CREATE SEQUENCE IF NOT EXISTS user_seq START WITH 1 INCREMENT BY 1;

DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users
(
    id        BIGINT  NOT NULL,
    name      VARCHAR(255),
    password  VARCHAR(255),
    email     VARCHAR(255),
    archive   BOOLEAN NOT NULL,
    role      VARCHAR(255),
    bucket_id BIGINT,
    CONSTRAINT pk_users PRIMARY KEY (id)
);

CREATE SEQUENCE IF NOT EXISTS bucket_seq START WITH 1 INCREMENT BY 1;

DROP TABLE IF EXISTS buckets CASCADE;
CREATE TABLE buckets
(
    id      BIGINT NOT NULL,
    user_id BIGINT,
    CONSTRAINT pk_buckets PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS users
    ADD CONSTRAINT FK_USERS_ON_BUCKET FOREIGN KEY (bucket_id) REFERENCES buckets (id);

ALTER TABLE IF EXISTS buckets
    ADD CONSTRAINT FK_BUCKETS_ON_USER FOREIGN KEY (user_id) REFERENCES users (id);

CREATE SEQUENCE IF NOT EXISTS category_seq START WITH 1 INCREMENT BY 1;

DROP TABLE IF EXISTS categories CASCADE;
CREATE TABLE categories
(
    id    BIGINT NOT NULL,
    title VARCHAR(255),
    CONSTRAINT pk_categories PRIMARY KEY (id)
);

CREATE SEQUENCE IF NOT EXISTS autopart_seq START WITH 1 INCREMENT BY 1;

DROP TABLE IF EXISTS autoparts CASCADE;
CREATE TABLE autoparts
(
    id    BIGINT NOT NULL,
    title VARCHAR(255),
    price DECIMAL,
    CONSTRAINT pk_autoparts PRIMARY KEY (id)
);

DROP TABLE IF EXISTS autoparts_categories CASCADE;
CREATE TABLE autoparts_categories
(
    autopart_id BIGINT NOT NULL,
    category_id BIGINT NOT NULL
);

ALTER TABLE IF EXISTS autoparts_categories
    ADD CONSTRAINT fk_autoparts_categories_on_autopart FOREIGN KEY (autopart_id) REFERENCES autoparts (id);

ALTER TABLE IF EXISTS autoparts_categories
    ADD CONSTRAINT fk_autoparts_categories_on_category FOREIGN KEY (category_id) REFERENCES categories (id);

DROP TABLE IF EXISTS buckets_autoparts CASCADE;
CREATE TABLE buckets_autoparts
(
    autopart_id BIGINT NOT NULL,
    backet_id   BIGINT NOT NULL
);

ALTER TABLE IF EXISTS buckets_autoparts
    ADD CONSTRAINT fk_buckets_autoparts_on_autopart FOREIGN KEY (autopart_id) REFERENCES autoparts (id);

ALTER TABLE IF EXISTS buckets_autoparts
    ADD CONSTRAINT fk_buckets_autoparts_on_bucket FOREIGN KEY (backet_id) REFERENCES buckets (id);

CREATE SEQUENCE IF NOT EXISTS order_seq START WITH 1 INCREMENT BY 1;

DROP TABLE IF EXISTS orders CASCADE;
CREATE TABLE orders
(
    id      BIGINT NOT NULL,
    created TIMESTAMP WITHOUT TIME ZONE,
    updated TIMESTAMP WITHOUT TIME ZONE,
    user_id BIGINT,
    sum     DECIMAL,
    adress  VARCHAR(255),
    status  VARCHAR(255),
    CONSTRAINT pk_orders PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS orders
    ADD CONSTRAINT FK_ORDERS_ON_USER FOREIGN KEY (user_id) REFERENCES users (id);

CREATE SEQUENCE IF NOT EXISTS order_details_seq START WITH 1 INCREMENT BY 1;

DROP TABLE IF EXISTS orders_details CASCADE;
CREATE TABLE orders_details
(
    id          BIGINT NOT NULL,
    order_id    BIGINT,
    autopart_id BIGINT,
    amount      DECIMAL,
    price       DECIMAL,
    CONSTRAINT pk_orders_details PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS orders_details
    ADD CONSTRAINT FK_ORDERS_DETAILS_ON_AUTOPART FOREIGN KEY (autopart_id) REFERENCES autoparts (id);

ALTER TABLE IF EXISTS orders_details
    ADD CONSTRAINT FK_ORDERS_DETAILS_ON_ORDER FOREIGN KEY (order_id) REFERENCES orders (id);