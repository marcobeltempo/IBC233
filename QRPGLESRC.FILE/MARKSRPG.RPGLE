000100160128     FMARKSDSP  CF   E             WORKSTN
000129160201      /FREE
000130160201           EXFMT RECORD1;
000131160204           DOW (*IN03 = '0');
000132160201               EXSR GETGRADE;
000133160211               *IN90 = *ON;
000134160201               EXFMT RECORD2;
000135160211               *IN90 = *OFF;
000136160204               IF *IN03 = *OFF;
000137160201                   EXSR CLEARMARKS;
000138160201                   EXFMT RECORD1;
000139160201               ENDIF;
000140160201           ENDDO;
000141160201           *INLR = *ON;
000142160204           RETURN;
000152160204                  BEGSR GETGRADE;
000153160204                     TESTOVRALL = (TEST1 + TEST2 + TEST3)/3;
000179160204                     NUMGRADE = TESTOVRALL + (LABS/100)*.30 + (EXAMS/100)*.35;
000180160204                   SELECT;
000181160204                     WHEN NUMGRADE <= 100 AND NUMGRADE >= 90;
000182160204                       LETGRADE = 'A+';
000183160204                     WHEN NUMGRADE <=89 AND NUMGRADE >= 80;
000184160204                       LETGRADE = 'A';
000185160204                     WHEN NUMGRADE <= 79 AND NUMGRADE >=75;
000187160204                       LETGRADE = 'B+';
000188160204                     WHEN NUMGRADE <=74 AND NUMGRADE >= 70;
000189160204                       LETGRADE = 'B';
000190160204                      WHEN NUMGRADE <=69 AND NUMGRADE >= 65;
000191160204                        LETGRADE = 'C+';
000192160204                        WHEN NUMGRADE <= 64 AND NUMGRADE >= 60;
000193160204                          LETGRADE = 'C';
000194160204                          WHEN NUMGRADE  <= 59 AND NUMGRADE >= 55;
000195160204                            LETGRADE = 'D+';
000196160204                            WHEN NUMGRADE <= 54 AND NUMGRADE >= 50;
000197160204                              LETGRADE = 'D';
000198160204                              WHEN NUMGRADE<= 49 AND NUMGRADE >=0;
000199160204                                LETGRADE = 'F';
000203160204                   ENDSL;
000204160204                  ENDSR;
000205160204                        BEGSR CLEARMARKS;
000206160204                          TEST1 = 0;
000207160204                          TEST2 = 0;
000208160204                          TEST3 = 0;
000209160204                          LABS = 0;
000210160204                          EXAMS = 0;
000211160204                          TESTOVRALL = 0;
000212160204                          NUMGRADE = 0;
000214160204                        ENDSR;
000215160204      /END-FREE
000216160201
000217160201
000218160201
000219160201
000220160201
000221160201
