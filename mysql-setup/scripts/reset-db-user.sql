SET @clean_up_query = CONCAT("DROP USER IF EXISTS '", @db_user, "'@", "'%'");
PREPARE clean_up_stmt FROM @clean_up_query;
EXECUTE clean_up_stmt;
DEALLOCATE PREPARE clean_up_stmt;

SET @create_user_query = CONCAT("CREATE USER '", @db_user, "'@", "'%' IDENTIFIED WITH mysql_native_password BY '", @db_user_password, "'");
PREPARE create_user_stmt FROM @create_user_query;
EXECUTE create_user_stmt;
DEALLOCATE PREPARE create_user_stmt;


SET @create_grant_query = CONCAT("GRANT ALL PRIVILEGES ON ", @db_name, ".* TO '", @db_user, "'@'%'");
PREPARE create_grant_stmt FROM @create_grant_query;
EXECUTE create_grant_stmt;
DEALLOCATE PREPARE create_grant_stmt;

SELECT Host, User, password_expired, User_attributes FROM mysql.user WHERE User=@db_user;
