SELECT TO_CHAR(start_dt, 'MM') AS monthly_res, COUNT(*) AS mr_cnt
		FROM reservation
		GROUP BY TO_CHAR(start_dt, 'MM') 
		ORDER BY monthly_res;
		
	SELECT * FROM RESERVATION;
	
        SELECT * FROM Chat_room cr 
        WHERE cr.se_user = 'dpwls444';
        
       SELECT * FROM IJ_USER iu ;
       SELECT * FROM BSN_USER bu;
      SELECT * FROM PRODUCT p ;
     
     
     SELECT * FROM CHAT_ROOM cr
     WHERE cr.RE_USER = 'dan001';
    
    SELECT cr.*, FROM CHAT_ROOM cr
    INNER JOIN IJ_USER iu ON iu.USER_ID = cr.SE_USER 
    WHERE cr.RE_USER ='dan001';
   
   SELECT * FROM CHAT_ROOM;
  
      SELECT *
      FROM chat_room cr
      INNER JOIN product p ON cr.RE_USER = p.BSN_ID
      WHERE cr.RE_USER = 'dan001';
      
     SELECT * FROM PRODUCT;
     
    SELECT ceo_name FROM BSN_USER bu 
    INNER JOIN PRODUCT p ON p.BSN_ID = bu.BSN_ID 
    WHERE p.PRO_ID = 1;
    