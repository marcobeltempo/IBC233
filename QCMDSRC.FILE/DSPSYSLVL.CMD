000100160314CMD      'DISPLAY SYSTEM LEVEL'
000101160321
000102160321PARM     KWD(OUTPUT)                   +
000103160314         TYPE(*CHAR)                        +
000104160314         LEN(9)                             +
000105160314         RSTD(*YES)                         +
000106160314         VALUES(*MSGLINE *DISPLAY *PRINTER) +
000107160324         MIN(1)                             +
000108160314         PROMPT('OUTPUT FOR SYSTEM LEVEL:')
000109160314
000110160321PARM     KWD(SOLUTION)                 +
000111160314         TYPE(*CHAR)                        +
000112160314         LEN(4)                             +
000113160314         RSTD(*YES)                         +
000114160314         VALUES(*YES *NO)                   +
000115160314         MIN(1)                             +
000116160314         PROMPT('TELL ME HOW YOU DID IT:')
000117160314
000118160321PARM     KWD(SHOWCMD)                  +
000119160314         TYPE(*CHAR)                        +
000120160314         LEN(4)                             +
000121160314         RSTD(*YES)                         +
000122160314         VALUES(*YES *NO)                   +
000123160314         MIN(1)                             +
000124160314         PROMPT('SHOW THIS COMMAND:')
000125160314
000126160314
