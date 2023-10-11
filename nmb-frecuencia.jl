function búsquedaLinealDesordenada(lista, palabra)
	tam = length(lista)
	
	i = 1
	while i <= tam
		if palabra == lista[i][1]
			return i
			break
		elseif i == tam
			return 0
		end
		i += 1
	end
end

"Devuelve la posición de un caracter en el conjunto de caracteres"
function posición(caracter)
	caracteres = " abcdefghijklmnopqrstuvwxyz"
#creo una cadena con todos los caracetes válidos ordenados y comparo cada elemento con el caracter dado por la función hasta encontrarlo
	
	for i in 1:length(caracteres)
		if caracter == caracteres[i]
			return i
		end
	end
end 

"Recibe 2 palabras: palabra1 y palabra2. Devuelve true si la palabra1 va antes que la palabra2 en el orden lexicográfico, de lo contracio devuelve false."
function mayorque(palabra1, palabra2)
	l1 = length(palabra1)
	l2 = length(palabra2)

	#Creo un iterador para comparar uno a uno los caracteres de las palabras, si en agún momento uno tiene uno "menor" que la otra, esta debería ser una palabra menor.
	i = 1
	while i <= l1 && i <= l2
		if posición(palabra1[i]) < posición(palabra2[i])
			return true
			#La función regresa un valor booleano, cierto si la palabras fueron dadas en orden creciente, falso de lo contrario
		elseif posición(palabra1[i]) > posición(palabra2[i])
			return false
		end
		i += 1
	end

	#Si alguna palabra tiene menos letras que otra con el mismo inicio, entoces es la menor.
	if l1 <= l2
		return true
	else
		return false
	end
	
end

"Dadas una palabra y una lista de listas (palabras y su respectiva frecuencia), devuelve la posición de la palabra en la lista"
function posición(palabra, lista)

	#Realizo un búsqueda binaria
	der = length(lista)


#Si la lista está vacía, entonce la palabra no se encuentra en ella y debería estar en la primera posición
  if der == 0 
      return [false,1]
  end
	
	izq = 1
	m = Int(floor((izq + der) / 2))

	#En cada iteración divido la lista a la mitad y comparo la palabra con la almacenada en el centro de la lista actual
	while izq < der
		m = Int(floor((izq + der) / 2))

		#Si es igual al elemento del centro, regreso que es verdadero que la palabra pertenesca a la lista y su posición
		if  lista[m] == palabra
			return [true, m]
		elseif mayorque(lista[m], palabra)
			#Si la palabra en la posición m es menor que la que busco, como la lista está ordenada puedo asegurar que 
			#las palabra anteriores también son menores, así que no las considero en la lista para la siguiente iteración
			izq = m + 1
		else 
			#Si la palabra en la posición m es mayor que la que busco, como la lista está ordenada puedo asegurar que 
			#las palabra a suderecha también son menores, así que no las considero en la lista para la siguiente iteración
			der = m - 1
		end
	end


	#Las opciones para la posición de la palabra en la lista se redujeron a 1 (en izq)
	if palabra == lista[izq][1]
		#Si la palabra en izq coincide con la que busco, regreso cierto y la posición
    		return [true, izq]
  	elseif mayorque(palabra, lista[izq])
		#Si la palabra en izq mayor la que busco, regreso falso y la posición que le corresponde es izq, ya que desplazaría todos los elementos
		#mayores a la derecha para abrir un lugar
		return [false, izq]
	else	
		#Si la palabra en izq menor la que busco, regreso falso y la posición que le corresponde es izq + 1 , ya que desplazaría todos los elementos
		#mayores a la derecha para abrir un lugar
		return [false, (izq + 1)]
	end
end	

"Dada una lista  de palabras, regresa la frecuencia en la que cada una aparece."
function frecuencia(lista)
	F = []

  tam = length(lista)
  if tam > 0
    push!(F, [lista[1], 1])
  end
    #print(1)
    #print(' ')
    #print(F)
    #print('\n')

  j = 2
	while j <= tam
    
    palabra = lista[j]

    #print(j)
    #print(' ')
    #print(palabra)
    #print(' ')
    #print(F)
    #print('\n')
    
		p = posición(palabra, F)
		if p[1] == true
			F[p[2]][2] += 1
		else
			push!(F, [".", 0])
			
			#Agrego un elemento extra a la lista y recorro todos los elementos posteriores a la palabra que quiero agragar (abro el espacio)
			i = length(F)
			while i > p[2]
				F[i] = F[i-1]
				i = i - 1
        #print(i)
        #print(' ')
        #print(F)
        #print('\n')
			end
      #print(p[2])
      #print('\n')
			F[p[2]][1] = palabra
			F[p[2]][2] = 1
      #print(F)
      #print('\n')
		end

    j += 1
	end
  return F
end
			
	
