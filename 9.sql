DELIMITER //
CREATE PROCEDURE SupplierService() 
BEGIN
    SELECT suppliers.SUPP_ID, suppliers.SUPP_NAME, rating.RAT_RATSTARS,
        CASE
            WHEN rating.RAT_RATSTARS = 5 THEN 'Excellent Service'
            WHEN rating.RAT_RATSTARS > 4 THEN 'Good Service'
            WHEN rating.RAT_RATSTARS > 2 THEN 'Average Service'
            ELSE 'Poor Service'
        END AS `Type of Service`
    FROM suppliers
    INNER JOIN `supplier_pricing` ON suppliers.SUPP_ID = `supplier_pricing`.SUPP_ID
    INNER JOIN `order` ON `supplier_pricing`.PRICING_ID = `order`.PRICING_ID
    INNER JOIN `rating` ON `order`.ORD_ID = `rating`.ORD_ID;
END //
DELIMITER ;