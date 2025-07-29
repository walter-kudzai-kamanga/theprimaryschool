-- Create tables for the school management system

-- Class table
CREATE TABLE IF NOT EXISTS class (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    academic_year VARCHAR(255),
    teacher_id BIGINT,
    room_number VARCHAR(255),
    schedule VARCHAR(255)
);

-- Staff table
CREATE TABLE IF NOT EXISTS staff (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    position VARCHAR(255),
    username VARCHAR(255),
    password VARCHAR(255),
    subjects VARCHAR(255),
    class_id BIGINT,
    phone_number VARCHAR(255),
    address VARCHAR(255),
    date_of_birth VARCHAR(255),
    hire_date VARCHAR(255),
    qualification VARCHAR(255)
);

-- Student table
CREATE TABLE IF NOT EXISTS student (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    username VARCHAR(255),
    password VARCHAR(255),
    class_id BIGINT,
    date_of_birth VARCHAR(255),
    gender VARCHAR(255),
    address VARCHAR(255),
    phone_number VARCHAR(255),
    parent_name VARCHAR(255),
    parent_phone VARCHAR(255),
    admission_date VARCHAR(255),
    student_number VARCHAR(255)
);

-- Finance Record table
CREATE TABLE IF NOT EXISTS finance_record (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(255),
    amount DOUBLE,
    type VARCHAR(255),
    date VARCHAR(255),
    student_id BIGINT,
    term VARCHAR(255),
    academic_year VARCHAR(255),
    payment_method VARCHAR(255),
    receipt_number VARCHAR(255)
);

-- Homework table
CREATE TABLE IF NOT EXISTS homework (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    description VARCHAR(255),
    subject VARCHAR(255),
    due_date VARCHAR(255),
    class_id BIGINT,
    teacher_id BIGINT
);

-- Attendance Record table
CREATE TABLE IF NOT EXISTS attendance_record (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    student_id BIGINT,
    date VARCHAR(255),
    present BOOLEAN
);

-- Inventory Item table
CREATE TABLE IF NOT EXISTS inventory_item (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    description VARCHAR(255),
    quantity INTEGER,
    category VARCHAR(255),
    location VARCHAR(255),
    supplier VARCHAR(255),
    cost DOUBLE
);

-- Transport Record table
CREATE TABLE IF NOT EXISTS transport_record (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    student_id BIGINT,
    route VARCHAR(255),
    pickup_time VARCHAR(255),
    dropoff_time VARCHAR(255),
    driver_name VARCHAR(255),
    vehicle_number VARCHAR(255),
    date VARCHAR(255)
); 