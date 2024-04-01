#INCLUDE <keys.bas>
#INCLUDE <retrace.bas>
#INCLUDE "PintaCosas.bas"
DIM x,y AS UBYTE
DIM bulletX, bulletY AS UBYTE
DIM shooting AS UBYTE
DIM bullet, nave, enemy AS STRING
bullet = "|"
nave = "[-0-]"
shooting = 0 
x=13
y=22


CLS

DibujarObjeto(x,y, nave)

DO
    waitretrace
    ControlaNave()  
    ControlaDisparo()
LOOP


SUB ControlaNave()
    IF GetKeyScanCode() <> 0 THEN
       BorrarObjeto(x,y)
       IF MultiKeys(KEYO) THEN
            IF x > 0 THEN
             x = x-1
            END IF
        END IF
        IF MultiKeys(KEYP) THEN
            IF x < 27 THEN
             x = x + 1
            END IF
        END IF
        IF MultiKeys(KEYSPACE) AND not shooting THEN
           bulletX = x + 2
           bulletY = y - 1
           shooting = 1
        END IF
        DibujarObjeto(x,y, nave)
    END IF
END SUB

SUB ControlaDisparo()
    IF shooting THEN
         IF bulletY > 0 THEN
             BorrarObjeto(bulletX, bulletY)
             bulletY = bulletY -1
             DibujarObjeto(bulletX, bulletY, bullet)
         ELSE 
             shooting = 0
             BorrarObjeto(bulletX, bulletY)
         END IF
    END IF
END SUB
