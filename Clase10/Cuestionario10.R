

### Ej: 01


## Si tengo 3 tibbles: tib1, tib2, tib3
# Y deseo unirlos a todos, y además, quiero quedarme solo con las observaciones
# que tienen llaves en los 3 tibbles (la llave es "id" y está todos los 
# tibbles). Entonces, ¿Cuál es la sintaxis que me permita obtener el resultado
# deseado?
  
  
# A. join_all(list(tib1,tib2,tib3), type = "full")
# B. join_all(list(tib1,tib2,tib3), type = "inner") (ESTE)
# C. join_all(tib1,tib2,tib3, type = "inner")
# D. join_all(list(tib1,tib2,tib3), type = "left")
# E. join_all(tib1,tib2,tib3, type = "left")


###### 2
## Si deseo programar una función en R y uno de los argumentos que deseo 
# usar es un caracter. Entonces, en la definición de la función debería de 
# usar el operador !! para llamar a este argumento?
  
# Seleccione una:
# Verdadero
# Falso (ESTE)

#### 3

# Si tengo los siguientes tibbles. tib1 y tib2.

## Y sé que en cada tibble la llave para emparejarlos es la variable "id", 
# la cual se encuentra en los 2 tibbles ¿Qué obtendré si ejecuto la siguiente
# sintaxis.?
  
# tib1 %>% anti_join(tib2, by="id")

# A. Todas las observaciones de tib2 que no tienen un match en tib1, asimismo, solo las columnas de tib1
# B. Todas las observaciones de tib2 que tienen un match en tib1, asimismo, solo las columnas de tib1
# C. Todas las observaciones de tib2 que no tienen un match en tib1, asimismo, todas las columnas de tib1 y tib2
# D. Todas las observaciones de tib1 que no tienen un match en tib2, asimismo, solo las columnas del tib1 (ESTE)
# E. Todas las observaciones de tib1 que no tienen un match en tib2, asimismo, todas las columnas de tib1 y tib2





