000100160304     FMARKSDSP  CF   E             WORKSTN
000101160324     FSTUDENTS2 IF   E             DISK
000102160304      /FREE
000103160304           EXFMT RECORD1;
000105160304           DOW (*IN03 = '0');
000108160304               EXSR GETGRADE;
000109160304               *IN90 = *ON;
000110160304               EXSR DROPTEST;
000111160304               *IN10 = *OFF;
000112160304               EXFMT RECORD2;
000113160304               *IN90 = *OFF;
000114160304               IF *IN03 = *OFF;
000115160304               EXSR CLEARMARKS;
000116160304               EXFMT RECORD1;
000117160304               ENDIF;
000118160304           ENDDO;
000119160304           *INLR = *ON;
000120160304           RETURN;
000121160304                  BEGSR DROPTEST;
000122160304     D  mingrade                      6p 2 inz(50.00)
000123160304                  SELECT;
000126160304                   WHEN TEST1 < TEST2 AND TEST1 < TEST3 AND TEST1 < mingrade;
000127160304                   *IN10=*ON;
000128160304                    ENDSL;
000129160304                    ENDSR;
000130160304                BEGSR GETGRADE;
000131160304                  TESTOVRALL = (TEST1 + TEST2 + TEST3)/3;
000132160304                   NUMGRADE = TESTOVRALL + (LABS/100)*.30 + (EXAMS/100)*.35;
000133160304                  SELECT;
000134160304                  WHEN NUMGRADE <= 100 AND NUMGRADE >= 90;
000135160304                 LETGRADE = 'A+';
000136160304                 WHEN NUMGRADE <=89 AND NUMGRADE >= 80;
000137160304                   LETGRADE = 'A';
000138160304                  WHEN NUMGRADE <= 79 AND NUMGRADE >=75;
000139160304                     LETGRADE = 'B+';
000140160304                  WHEN NUMGRADE <=74 AND NUMGRADE >= 70;
000141160304                     LETGRADE = 'B';
000142160304                   WHEN NUMGRADE <=69 AND NUMGRADE >= 65;
000143160304                      LETGRADE = 'C+';
000144160304                    WHEN NUMGRADE <= 64 AND NUMGRADE >= 60;
000145160304                      LETGRADE = 'C';
000146160304                    WHEN NUMGRADE  <= 59 AND NUMGRADE >= 55;
000147160304                         LETGRADE = 'D+';
000148160304                     WHEN NUMGRADE <= 54 AND NUMGRADE >= 50;
000149160304                           LETGRADE = 'D';
000150160304                      WHEN NUMGRADE<= 49 AND NUMGRADE >=0;
000151160304                           LETGRADE = 'F';
000152160304                   ENDSL;
000153160304                  ENDSR;
000154160304                      BEGSR CLEARMARKS;
000155160304                     TEST1 = 0;
000156160304                     TEST2 = 0;
000157160304                     TEST3 = 0;
000158160304                     LABS = 0;
000159160304                     EXAMS = 0;
000160160304                     TESTOVRALL = 0;
000161160304                     NUMGRADE = 0;
000162160304                      ENDSR;
000163160304      /END-FREE
