PROGRAM CountChars (INPUT, OUTPUT);
USES 
  Count3;
VAR
  Ch: CHAR;
  A, B, C: CHAR;
BEGIN
  Start; 
  WHILE NOT EOLN DO
  BEGIN
    READ(Ch);
    WRITE(Ch);
    Bump   
  END;
  READLN; 
  Value(A, B, C);
  WRITELN;
  IF A > '0'
  THEN
    WRITELN('Количество символов: ', A, B, C)
  ELSE
    IF B > '0'
    THEN
      WRITELN('Количество символов: ', B, C)   
    ELSE
      IF C > '0'
      THEN
        WRITELN('Количество символов: ', C)
      ELSE
        WRITELN('Вы ничего не ввели')      
END.
