EJEMPLO 1-1: CONTADOR DE PALABRAS (fb1-1.l)

DESCRIPCIÓN:
Este programa cuenta líneas, palabras y caracteres en un texto. Lee la entrada estándar y muestra
estadísticas básicas del texto procesado.

COMPILACIÓN:
$ flex fb1-1.l
$ cc lex.yy.c -lfl

EJECUCIÓN:
$ ./a.out
david es nicaraguense
y vive en santa marta
^D

SALIDA ESPERADA:
       2       8      44

EXPLICACIÓN:
2 líneas, 8 palabras, 44 caracteres

EJEMPLO 1-2: TRADUCTOR INGLÉS-AMERICANO (fb1-2.l)

DESCRIPCIÓN:
Este programa traduce palabras del inglés británico al inglés
americano, reemplazando palabras como "colour" por "color" y
"flavour" por "flavor" mientras deja pasar el resto del texto
sin modificar.

COMPILACIÓN:
$ flex fb1-2.l
$ cc lex.yy.c -lfl

EJECUCIÓN:
$ ./a.out
The colour and flavour are clever
^D

SALIDA ESPERADA:
The color and flavor are smart

EXPLICACIÓN:
Reemplaza palabras británicas por americanas

EJEMPLO 1-3: SCANNER SIMPLE DE CALCULADORA (fb1-3.l)

DESCRIPCIÓN:
Este programa reconoce e identifica tokens de una calculadora
(números, operadores aritméticos, saltos de línea) e imprime
el nombre de cada token encontrado, útil para entender el
proceso de análisis léxico.

COMPILACIÓN:
$ flex fb1-3.l
$ cc lex.yy.c -lfl

EJECUCIÓN:
$ ./a.out
12+34
5 6 / 7
^D

SALIDA ESPERADA:
NUMBER 12
PLUS
NUMBER 34
NEWLINE
NUMBER 5
NUMBER 6
DIVIDE
NUMBER 7
NEWLINE

EXPLICACIÓN:
Identifica y nombra cada token encontrado

EJEMPLO 1-4: SCANNER CON CÓDIGOS DE TOKEN (fb1-4.l)

DESCRIPCIÓN:
Este programa reconoce tokens de calculadora y retorna códigos
numéricos para cada token (258 para números, 259 para suma, etc.),
además de almacenar el valor de los números, preparando el terreno
para su uso con un parser.

COMPILACIÓN:
$ flex fb1-4.l
$ cc lex.yy.c -lfl

EJECUCIÓN:
$ ./a.out
a / 34 + |45
^D

SALIDA ESPERADA:
Mystery character a
262
258 = 34
259
263
258 = 45
264

EXPLICACIÓN:
258 = NUMBER, 259 = ADD, 260 = SUB, 261 = MUL, 262 = DIV,
263 = ABS, 264 = EOL

EJEMPLO 1-5 y 1-6: CALCULADORA COMPLETA (fb1-5.y + fb1-5.l)

DESCRIPCIÓN:
Este programa es una calculadora funcional que evalúa expresiones
aritméticas respetando la precedencia de operadores (multiplicación
y división antes que suma y resta), e incluye el operador de valor
absoluto, combinando scanner y parser.

COMPILACIÓN:
$ bison -d fb1-5.y
$ flex fb1-5.l
$ cc -o fb1-5 fb1-5.tab.c lex.yy.c -lfl

EJECUCIÓN:
$ ./fb1-5
2 + 3 * 4
= 14
2 * 3 + 4
= 10
20 / 4 - 2
= 3
20 - 4 / 2
= 18
|5 - 10|
= 5
^D

EXPLICACIÓN:
Evalúa expresiones con precedencia correcta:
* y / tienen mayor precedencia que + y -


