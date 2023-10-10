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
	
	i = 1
	while i <= l1 && i <= l2
		if posición(palabra1[i]) < posición(palabra2[i])
			return true
		elseif posición(palabra1[i]) > posición(palabra2[i])
			return false
		end
		i += 1
	end
	
	if l1 <= l2
		return true
	else
		return false
	end
	
end

"Dadas una palabra y una lista, devuelve la posición de la palabra en la lista"
function posición(palabra, lista)
	der = length(lista)

  if der == 0 
      return 1
  end
	
	izq = 1
	m = Int(floor((izq + der) / 2))
	
	while izq < der
		m = Int(floor((izq + der) / 2))
		if  lista[m] == palabra
			return [true, m]
		elseif mayorque(lista[m], palabra)
			izq = m + 1
		else 
			der = m - 1
		end
	end
	
	if mayorque(palabra, lista[izq])
		return [false, izq]
	else
		return [false, (izq + 1)]
	end
end	


			
	
