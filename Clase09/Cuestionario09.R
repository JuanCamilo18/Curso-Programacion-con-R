
### Ej 01:
# ¿Un tibble también es un data frame?
  
# Seleccione una:
#Verdadero


### Ej 02:
# Si tengo el siguiente tibble que se llama tibble2.
# ¿Qué sucede si corro la siguiente sintaxis?
tibble2 %>% group_by(año) %>% 
  summarise(media_ventas=mean(ventas),
            mediana_ventas=median(ventas))


## A.Calcula la media y la mediana de las ventas por año. (Este)
# B. Ninguna de las anteriores.
# C. Calcula los estadísticos descriptivos a excepción de la media y la mediana.
# D. Calcula la media de las ventas por año.
# E. Calcula la media y la mediana de las ventas.


### Ej 03:
## Seleccione las respuestas correctas.

# ¿Cuál es la función en el paquete dplyr para crear nuevas columnas?
# Respuesta 1: mutate() 

## ¿Cuál es la función en el paquete dplyr para resumir datos?
# Respuesta 2: summarise()
  
## ¿Cuál es la función en el paquete dplyr para agrupar por columnas?
# Respuesta 3: group_by()

## ¿Cuál es la función en el paquete dplyr para seleccionar columnas?
# Respuesta 4: select()

## ¿Cuál es la función en el paquete dplyr para ordenar observaciones?
# Respuesta 5: arrange()

## ¿Cuál es la función en el paquete dplyr para filtrar filas?	Respuesta 6
# Respuesta 6: filter()


### Ej 04:

## Tengo un tibble que se llama tibble1.

# ¿Y si ejecuto la siguiente sintaxis obtendré?
  
tibble1 %>% select(edad,ingresos) %>% filter(edad>50)


## A. Más de una es cierta
## B. El tibble original en donde las observaciones de la edad son mayores a 50.
## C. Todas las columnas del tibble menos edad e ingresos en donde las 
# observaciones de la edad son mayores a 50.
## D.Las columnas edad e ingresos en donde las observaciones de la edad 
# son mayores a 50. (ESTE)
## E.Selecciono la edad en donde las observaciones de la edad son mayores a 
# 50 y filtro la columna edad e ingresos.



