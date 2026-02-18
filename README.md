# Flex & Bison

Este repositorio contiene el desarrollo de los ejemplos y ejercicios del libro "Flex & Bison".

## Contenido del repositorio

El trabajo está dividido en dos carpetas principales:

- `Ejemplos/` :Contiene los ejemplos 1, 2, 3, 4 y 5 del capítulo 1 funcionando correctamente.
- `Ejercicios/` :Contiene la resolución de los ejercicios 1, 2, 3, 4, 5 y 6 .

---

## ¿Qué se realizó?

1. Se instalaron y configuraron las herramientas **flex** y **bison** en el entorno Linux.
2. Se implementaron y probaron los ejemplos del libro.
3. Se resolvieron los ejercicios propuestos en el capítulo.
4. Se compilaron y ejecutaron todos los programas para verificar su correcto funcionamiento.

---

## Compilación

Para compilar cualquier archivo `.l` o `.y` se utilizaron comandos como:

```bash
flex archivo.l
bison -d archivo.y
gcc lex.yy.c archivo.tab.c -o programa -lfl

Y para ejecutar

./programa
