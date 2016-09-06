000100121030  CMD 'HELLO UNIVERSE'                                                                              
000200121030                                                                                                    
000300121030  PARM   KWD(PLANET)                                   +                                            
000400121030         MIN(1)                                        +                                            
000500121030         TYPE(*CHAR) LEN(8)                            +                                            
000600121030         PROMPT('DESTINATION PLANET:')                                                              
000700121030  PARM   KWD(MYNAME)                                   +                                            
000800121030         MIN(1)                                        +                                            
000900121031         TYPE(*CHAR)  LEN(31)                          +                                            
001000121030         PROMPT('MY NAME:')                                                                         
001100121030  PARM   KWD(OUTPUT)                                   +                                            
001200121030         TYPE(*CHAR) LEN(9)                            +                                            
001300121030         RSTD(*YES)                                    +                                            
001400121030         VALUES(*MSGLINE *DISPLAY *PRINTER)            +                                            
001500121031         DFT(*MSGLINE)                                 +                                            
001600121030         PROMPT('OUTPUT FOR UNIVERSE MESSAGE:')                                                     
001700121030  PARM   KWD(SHOWNME)                                  +                                            
001800121030         TYPE(*CHAR)  LEN(4)                           +                                            
001900121030         RSTD(*YES)                                    +                                            
002000121030         VALUES(*YES *NO)                              +                                            
002100121030         DFT(*NO)                                      +                                            
002200121030         PROMPT('SHOW NAME:')                                                                       
