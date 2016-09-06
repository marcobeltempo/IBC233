000100160406     FCONFIRMPAYCF   E             WORKSTN                                                          
000101160408     FPAYRPT    O    E             PRINTER OFLIND (*IN01)                                           
000102160407     FSHIFTRATESIF   E             DISK    RENAME (SHIFTRATES:SHIFTRATER)                           
000103160407     FALLSHIFT  IF   E           K DISK    RENAME (ALLSHIFT:ALLSHIFTR)                              
000104160406     DHOURSOVER        S              3  0                                                          
000105160331      /FREE                                                                                         
000106160407             READ SHIFTRATES;                                                                       
000107160407             Write TITLE;                                                                           
000108160407             Write COLHDG;                                                                          
000109160331             READ ALLSHIFT;                                                                         
000110160331             DOW NOT %EOF;                                                                          
000111160331               EXSR PAYSR;                                                                          
000112160331               IF *IN01;                                                                            
000113160407                 Write TITLE;                                                                       
000114160407                 Write COLHDG;                                                                      
000115160331                 *IN01 = *Off;                                                                      
000116160331               ENDIF;                                                                               
000117160407               Write EMPDETAIL;                                                                     
000118160331               Read ALLSHIFT;                                                                       
000119160331             ENDDO;                                                                                 
000120160406             WRITE TOTALS;                                                                          
000121160406       EXFMT RECORD1;                                                                               
000122160406       *INLR = *ON;                                                                                 
000123160406       RETURN;                                                                                      
000124160406                                                                                                    
000125160406       BEGSR PAYSR;                                                                                 
000126160406       SELECT;                                                                                      
000127160406         WHEN WORKSHIFT = 'D';                                                                      
000128160406           HOURLYRATE = DAYRATE;                                                                    
000129160406           WHEN WORKSHIFT = 'A';                                                                    
000130160407             HOURLYRATE = AFTNRATE;                                                                 
000131160406             WHEN WORKSHIFT = 'N';                                                                  
000132160406               HOURLYRATE = NIGHTRATE;                                                              
000133160406       ENDSL;                                                                                       
000134160406                                                                                                    
000135160406       SELECT;                                                                                      
000136160406         WHEN PAYGRADE = '1';                                                                       
000137160408         EVAL(H) HOURLYRATE = HOURLYRATE * 1.073;                                                   
000138160406           WHEN PAYGRADE = '2';                                                                     
000139160408             EVAL(H) HOURLYRATE = HOURLYRATE * 1.054;                                               
000140160406             WHEN PAYGRADE = '3';                                                                   
000141160408               EVAL(H) HOURLYRATE = HOURLYRATE * 0.955;                                             
000142160406       ENDSL;                                                                                       
000143160406                                                                                                    
000144160406       IF HRSWORKED > 40;                                                                           
000145160406         REGULARPAY = 40 * HOURLYRATE;                                                              
000146160406         HOURSOVER = HRSWORKED - 40;                                                                
000147160408         OVERPAY = HOURSOVER * HOURLYRATE * 1.5;                                                    
000148160406         TOTREGPAY = TOTREGPAY + REGULARPAY;                                                        
000149160406         TOTOVTPAY = TOTOVTPAY + OVERPAY;                                                           
000150160406                                                                                                    
000151160406         ELSE;                                                                                      
000152160406           REGULARPAY = HRSWORKED * HOURLYRATE;                                                     
000153160406           TOTREGPAY = TOTREGPAY + REGULARPAY;                                                      
000154160406           TOTALPAY = OVERPAY + REGULARPAY;                                                         
000155160406           OVERPAY = 0;                                                                             
000156160406           ENDIF;                                                                                   
000157160406           TOTEMPPAY = TOTREGPAY + TOTOVTPAY;                                                       
000158160406           ENDSR;                                                                                   
000159160406                                                                                                    
000160160406           /END-FREE                                                                                
