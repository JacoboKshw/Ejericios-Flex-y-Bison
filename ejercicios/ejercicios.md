EJERCICIO 1: CALCULADORA CON COMENTARIOS (ejercicio1.y + ejercicio1.l)

DESCRIPCIÓN:
Esta calculadora acepta líneas vacías y comentarios de estilo //,
resolviendo el problema de que la calculadora original rechazaba
líneas que solo contenían comentarios o estaban vacías.

COMPILACIÓN:
$ bison -d ejercicio1.y
$ flex ejercicio1.l
$ cc -o ejercicio1 ejercicio1.tab.c lex.yy.c -lfl

EJECUCIÓN:
$ ./ejercicio1
2 + 3
= 5

4 * 5
= 20
^D

EXPLICACIÓN:
Acepta comentarios // y líneas vacías sin error

DESCRIPCIÓN:
Esta calculadora acepta números tanto en formato decimal como
hexadecimal (con prefijo 0x o 0X) y muestra los resultados en
ambos formatos, permitiendo mezclar libremente ambos tipos de
números en las expresiones.

COMPILACIÓN:
$ bison -d ejercicio2.y
$ flex ejercicio2.l
$ cc -o ejercicio2 ejercicio2.tab.c lex.yy.c -lfl

EJECUCIÓN:
$ ./ejercicio2
0xFF + 1
= 256 (decimal) = 0x100 (hex)
0x10 * 2
= 32 (decimal) = 0x20 (hex)
100 + 0x64
= 200 (decimal) = 0xC8 (hex)
0XFF
= 255 (decimal) = 0xFF (hex)
^D

EXPLICACIÓN:
Reconoce 0xFF como 255, mezcla decimal y hex, muestra ambos formatos

TABLA DE REFERENCIA:
Decimal  →  Hexadecimal
10       →  0xA
16       →  0x10
255      →  0xFF
256      →  0x100

EJERCICIO 3: CALCULADORA CON AND/OR (ejercicio3.y + ejercicio3.l)

DESCRIPCIÓN:
Esta calculadora incluye operadores bit a bit AND (&) y OR (^),
respetando la precedencia correcta donde AND tiene mayor precedencia
que OR, y el operador | sigue siendo valor absoluto sin conflicto.

COMPILACIÓN:
$ bison -d ejercicio3.y
$ flex ejercicio3.l
$ cc -o ejercicio3 ejercicio3.tab.c lex.yy.c -lfl

EJECUCIÓN:
$ ./ejercicio3
5 & 3
= 1
5 ^ 3
= 7
8 & 7
= 0
|5| & 7
= 5
1 ^ 2 & 2
= 3
^D

EXPLICACIÓN DE OPERACIONES:
5 & 3  →  101 & 011 = 001 = 1
5 ^ 3  →  101 | 011 = 111 = 7
8 & 7  →  1000 & 0111 = 0000 = 0

PRECEDENCIA (mayor a menor):
1. * /
2. + -
3. & (AND)
4. ^ (OR)


NOTA: Se generan 6 conflictos shift/reduce (es normal y correcto)

EJERCICIO 4:
No, el scanner hecho a mano no reconoce exactamente los mismos tokens que el de flex. En la mayoría de los casos normales funcionan igual y dan los mismos resultados, pero cuando aparecen situaciones especiales, como el fin de archivo (EOF) o ciertos errores en la entrada, pueden comportarse diferente. Flex maneja automáticamente muchos de esos casos y es más robusto porque genera internamente un autómata optimizado. En cambio, el scanner manual necesita más lógica adicional y puede ser más fácil cometer errores. Así que, aunque en la práctica parecen iguales, no son idénticos en todos los escenarios.

EJERCICIO 5:
Sí, hay lenguajes para los que flex no es la mejor opción. Por ejemplo, en lenguajes donde la indentación es importante, como Python, se necesita llevar un control de los niveles de espacios o tabulaciones, y eso no se maneja fácilmente solo con expresiones regulares. También hay problemas en lenguajes que permiten estructuras anidadas que deben estar balanceadas, o donde una palabra puede ser palabra reservada o identificador dependiendo del contexto. En esos casos, flex se queda corto o requiere mucho código adicional en C. Además, si el lenguaje es muy simple, usar flex puede ser exagerado.

EJERCICIO 6:
Al reescribir el programa de conteo de palabras (word count) en C y probarlo con archivos grandes, normalmente la versión en C resulta un poco más rápida, ya que está compilada directamente a código máquina y no tiene la sobrecarga que puede tener una herramienta generada con flex.
