LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/OrderDetails.csv'
INTO TABLE orderDetails
FIELDS TERMINATED BY ';'      
ENCLOSED BY ''                
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;