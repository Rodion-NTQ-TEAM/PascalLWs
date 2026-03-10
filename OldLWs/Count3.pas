UNIT Count3;
INTERFACE

PROCEDURE Start;
  { Присваивает переменным Ones, Tens, Hundreds символ '0'. }

PROCEDURE Bump;
  { Увеличивает значение счётчика на 1, если текущее значение меньше 999. 
  При попытке увеличить 999 счётчик остаётся равным 999. }

PROCEDURE Value (VAR V100, V10, V1: CHAR);
  { Присваивает параметрам V100, V10, V1 значения
    переменных Hundreds, Tens, Ones соответственно. }

IMPLEMENTATION
VAR 
  Ones, Tens, Hundreds: CHAR;
PROCEDURE Start;
BEGIN {Start}
  Ones := '0';
  Tens := '0';
  Hundreds := '0'
END; {Start}

PROCEDURE NextDigit(VAR Digit: CHAR);
  { Заменяет цифру на следующую по порядку
    от '0' до '9' с циклическим переходом ('9' -> '0'). }
BEGIN {NextDigit}
  IF Digit = '0' THEN Digit := '1' ELSE
  IF Digit = '1' THEN Digit := '2' ELSE
  IF Digit = '2' THEN Digit := '3' ELSE
  IF Digit = '3' THEN Digit := '4' ELSE
  IF Digit = '4' THEN Digit := '5' ELSE
  IF Digit = '5' THEN Digit := '6' ELSE
  IF Digit = '6' THEN Digit := '7' ELSE
  IF Digit = '7' THEN Digit := '8' ELSE
  IF Digit = '8' THEN Digit := '9' ELSE
  IF Digit = '9' THEN Digit := '0'
END; {NextDigit}

PROCEDURE Bump;
BEGIN {Bump}
  NextDigit(Ones); {Сдвигаем счётчик едениц}
  IF Ones = '0'    {Проверяем перевалил ли счётчик едениц за 9}
  THEN
    BEGIN
      NextDigit(Tens); {Если счётчик едениц перевалил за 9 сдвигаем счётчик десяток}
      IF Tens = '0'     {Проверяем перевалил ли счётчик десяток за 9}
      THEN
        BEGIN
          NextDigit(Hundreds);  {Если счётчик десяток перевалил за 9 сдвигаем счётчик десяток}
          IF Hundreds = '0'     {Проверка на переполнение}
          THEN
            BEGIN
              { Переполнение оставляем 999 }
              Ones := '9';
              Tens := '9';
              Hundreds := '9'
            END
        END
    END
END; {Bump}

PROCEDURE Value (VAR V100, V10, V1: CHAR); {Присваивание V100 к Hundreads, V10 к Tens, V1 к Ones}
BEGIN {Value}
  V100  := Hundreds;
  V10  := Tens;
  V1  := Ones
END; {Value}

BEGIN
END. {Count3}
