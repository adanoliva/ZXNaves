SUB DibujarObjeto(x as UBYTE, y as UBYTE, obj as STRING)
    PRINT AT y, x; PAPER 7; INK 2; obj;
END SUB

SUB BorrarObjeto(x as UBYTE, y as UBYTE)
    PRINT AT y, x; PAPER 7; INK 2; "     ";
END SUB