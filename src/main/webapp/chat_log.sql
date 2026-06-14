CREATE TABLE chat_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY, /*로그번호자동생성, 실무에서 많이 씀*/
    customer_id VARCHAR(40),
    room_name VARCHAR(80),
    action VARCHAR(40),
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP /*mysql-timestamp시간정보*/
);