



# E01: En la siguiente función. 
re<-function(x){
  if(is.numeric(x)){
    if(x>20){
      t<-x+20
    } else {
      t<-x-20
      message("Salio")
    }
    return(t) 
  } else {
    stop("Hola, no soy numérico")
  }
}

re(5)

# Qué tiene que tomar x para que arroje el mensaje "Salio" 
# seguido de la respuesta numérica.


A. x tiene que ser un elemento numérico y menor igual a 20

B. x tiene que ser un elemento entero

C. Cualquier cosa, pero que x sea un elemento numérico.

# D. Más de una es correcta (Este)

E.x tiene que ser un elemento entero y menor igual a 20




# E02: En la siguiente función.
re2<-function(x){
  if(is.vector(x)){
    2*x
  } else if(is.matrix(x)){
    3*x
  } else {
    stop("O no")
  }
}

re2(c(1,3,4))


# ¿Cuándo la función arrojará "O no"? 

# A. Cuando x sea un vector.

# B. Cuando x no sea un vector o una matriz (Este)

# C. Cuando x sea una matriz.

# D. Cuando x sea una matriz o un vector.

# E. Cuando x sea una lista.



# E03:
# ¿Cuándo uso la función stop() le indico a R que arroje un mensaje de 
# advertencia y que continúe con la ejecución?

# Falso












