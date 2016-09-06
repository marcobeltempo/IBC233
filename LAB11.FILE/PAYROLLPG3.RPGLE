000100160411     FCONFIRMPY2CF   E             WORKSTN                                                          
000101160411     FPAYRPT2   O    E             PRINTER OFLIND (*IN01)                                           
000102160407     FSHIFTRATESIF   E             DISK    RENAME (SHIFTRATES:SHIFTRATER)                           
000103160407     FALLSHIFT  IF   E           K DISK    RENAME (ALLSHIFT:ALLSHIFTR)                              
000104160406     DHOURSOVER        S              3  0                                                          
000105160415     DMAIN             PR                  EXTPGM('PAYROLLPG3')                                     
000106160411     DSHIFTTYPE                      30                                                             
000107160411     DMAIN             PI                                                                           
000108160411     DSHIFTTYPE                      30                                                             
000110160331      /FREE                                                                                         
000111160407             READ SHIFTRATES;                                                                       
000112160407             Write TITLE;                                                                           
000113160407             Write COLHDG;                                                                          
000114160331             READ ALLSHIFT;                                                                         
000115160331             DOW NOT %EOF;                                                                          
000116160331               EXSR PAYSR;                                                                          
000117160331               IF *IN01;                                                                            
000118160407                 Write TITLE;                                                                       
000119160407                 Write COLHDG;                                                                      
000120160331                 *IN01 = *Off;                                                                      
000121160331               ENDIF;                                                                               
000122160407               Write EMPDETAIL;                                                                     
000123160331               Read ALLSHIFT;                                                                       
000124160331             ENDDO;                                                                                 
000125160406             WRITE TOTALS;                                                                          
000126160406       EXFMT RECORD1;                                                                               
000127160406       *INLR = *ON;                                                                                 
000128160406       RETURN;                                                                                      
000129160406                                                                                                    
000130160406       BEGSR PAYSR;                                                                                 
000131160406       SELECT;                                                                                      
000132160406         WHEN WORKSHIFT = 'D';                                                                      
000133160406           HOURLYRATE = DAYRATE;                                                                    
000134160406           WHEN WORKSHIFT = 'A';                                                                    
000135160407             HOURLYRATE = AFTNRATE;                                                                 
000136160406             WHEN WORKSHIFT = 'N';                                                                  
000137160406               HOURLYRATE = NIGHTRATE;                                                              
000138160406       ENDSL;                                                                                       
000139160406                                                                                                    
000140160406       SELECT;                                                                                      
000141160406         WHEN PAYGRADE = '1';                                                                       
000142160408         EVAL(H) HOURLYRATE = HOURLYRATE * 1.073;                                                   
000143160406           WHEN PAYGRADE = '2';                                                                     
000144160408             EVAL(H) HOURLYRATE = HOURLYRATE * 1.054;                                               
000145160406             WHEN PAYGRADE = '3';                                                                   
000146160408               EVAL(H) HOURLYRATE = HOURLYRATE * 0.955;                                             
000147160406       ENDSL;                                                                                       
000148160406                                                                                                    
000149160406       IF HRSWORKED > 40;                                                                           
000150160406         REGULARPAY = 40 * HOURLYRATE;                                                              
000151160406         HOURSOVER = HRSWORKED - 40;                                                                
000152160408         OVERPAY = HOURSOVER * HOURLYRATE * 1.5;                                                    
000153160406         TOTREGPAY = TOTREGPAY + REGULARPAY;                                                        
000154160406         TOTOVTPAY = TOTOVTPAY + OVERPAY;                                                           
000155160406                                                                                                    
000156160406         ELSE;                                                                                      
000157160406           REGULARPAY = HRSWORKED * HOURLYRATE;                                                     
000158160406           TOTREGPAY = TOTREGPAY + REGULARPAY;                                                      
000159160406           TOTALPAY = OVERPAY + REGULARPAY;                                                         
000160160406           OVERPAY = 0;                                                                             
000161160406           ENDIF;                                                                                   
000162160406           TOTEMPPAY = TOTREGPAY + TOTOVTPAY;                                                       
000163160406           ENDSR;                                                                                   
000164160406                                                                                                    
000165160411      /END-FREE                                                                                     
