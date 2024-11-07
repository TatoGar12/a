
-- Existing replication user setup
CREATE USER 'replica_user'@'%' IDENTIFIED BY 'replica_password';
GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';
FLUSH PRIVILEGES;

-- Create 'api' user with external access
CREATE USER 'api'@'%' IDENTIFIED BY 'api_password';
GRANT ALL PRIVILEGES ON mydatabase.* TO 'api'@'%';
FLUSH PRIVILEGES;
