USE banking_manager;
DROP PROCEDURE sp_deposit;
DELIMITER //
	CREATE PROCEDURE sp_deposit(IN id INT, IN money DOUBLE)
	BEGIN 
	UPDATE customers
	SET balance = balance + money WHERE customers.id = id;

	INSERT INTO deposits(customer_id,amount,deposits_time)
	VALUES(id,money,sysdate());

	End //

DROP PROCEDURE sp_withdraws;
DELIMITER //
CREATE PROCEDURE sp_withdraws(IN id INT , IN money DOUBLE)
	BEGIN 
	DECLARE balance1 DOUBLE ;
	SET balance1 = (SELECT c.balance FROM customers c WHERE c.id = id);

	IF (balance1 >= money AND balance1 > 0) THEN  
	SET balance1 = balance1 - money ; 

	UPDATE customers
	SET balance = balance1 WHERE customers.id=id; 

	INSERT INTO withdraws(customer_id , amount,withdraws_time)
	VALUES(id,money,sysdate());
	END IF;
	END //
    
DROP PROCEDURE sp_transfers;
DELIMITER //
CREATE PROCEDURE sp_transfers(IN deposits_id INT,IN withdraws_id INT , IN money DOUBLE)
BEGIN 
	DECLARE deposits_balance DOUBLE;
	DECLARE withdraws_balance DOUBLE;
	SET deposits_balance = ( SELECT c.balance FROM customers c WHERE c.id = deposits_id);
	SET withdraws_balance = (SELECT c.balance FROM customers c where c.id = withdraws_id);

	IF (deposits_balance >= (money+money*10/100) AND deposits_balance > 0) THEN
	SET deposits_balance = deposits_balance - (money+money*10/100);
    SET withdraws_balance = withdraws_balance + money;
	
	UPDATE customers
	SET balance = deposits_balance WHERE customers.id = deposits_id;
	UPDATE customers
	SET balance = withdraws_balance WHERE customers.id = withdraws_id;

	INSERT INTO transfers(deposits_id, withdraws_id, amount, fee, transfers_time)
    VALUES(deposits_id, withdraws_id, money, money*10/100, sysdate());


END IF;
END//

-- DELIMITER //
-- CREATE PROCEDURE views()
-- BEGIN 	
-- SELECT 

-- END //



CALL sp_deposit(1,6000);

CALL sp_withdraws(1,-1000);

CALL sp_transfers(2,1,7000);

