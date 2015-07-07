# MutationsViewer
Simple Processing mutation position viewer


Pequeño visor que muestra la posición de una o más mutaciones dentro de los cromosomas humanos.
Para ello, hace uso de 2 ficheros:

* **cytCoor.tsv**: Contiene la información relativa a las citobandas dentro de los cromosomas. 
  Las coordenadas, según el orden de aparición son el cromosoma, el brazo (p o q), el identificador
  de la citobanda y el par de bases en el que empieza y acaba cada una.
  
* **muts.tsv**: Lisado de mutaciones a representar. Compuesto por dos columnas. La primera es el cromosoma
  en el que está situada la mutación, y la segunda la posición de la base mutada.
  
  
  
La salida puede ser mostrada de dos formas, en función del valor de la variable **pdfOrScreen**.
En el caso de que el valor sea *false*, el resultado se mostrará por pantalla.
En caso contrario se creará un archivo pdf con el resultado, denominado como **result.pdf**.

Para poder ejecutarlo en Processing, es necesario que estos tres ficheros estén situados dentro de una 
carpeta que se denomine igual que el fichero **.pde**.
