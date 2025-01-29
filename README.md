# M2-LexYacc
[M2] Laboratorio - Construcción de la fase inicial de un Compilador con Lex y Yacc

### ¿Cómo correr este programa?
- Deberás tener Docker instalado.
- Luego en la carpeta donde se encuentra el Dockerfile, correr el siguiente comando:
```bash
docker build --rm . -t lab1-image && docker run --rm -ti -v "$(pwd)":/home lab1-image
```
- Luego de esto deberás compilar el programa, esto lo haces con:
```bash
sh buildLanguage.sh
```
- Ahora para utilizar el programa utilizas:
```bash
./calc
```

### ¿Qué tiene este programa?

- El programa soporta operaciones aritméticas simples como: Suma, Resta, Multiplicación y División
- También con soporte para paréntesis para jerarquía de operaciones
- Manejo de errores

### Ejemplo de Sintáxis:

```bash
x=3*5+3; // Asi se asigna una variable, nótese que el ; es necesario para las asignaciones únicamente
Assign x = 18;



y=(36/(3+3));
Assign y = 6;



z=(x/y)+(x*y)-y;
Assign z = 105;



z: // El : sirve para mostrar el valor de una variable, no necesita ;
Variable asignada con valor: 105



@=1; //Manejo de errores

Error: Token inválido '@'
Parser error: Error sintáctico en statement.


x=@; //Manejo de errores

Error: Token inválido '@'
Parser error: Error sintáctico en statement.


y: //Manejo de errores

Warning: variable 'y' no inicializada. Valor = 0
Variable asignada con valor: 0


@=@; //Manejo de errores

Error: Token inválido '@'
Error: Token inválido '@'
Parser error: Error sintáctico en statement.
```
