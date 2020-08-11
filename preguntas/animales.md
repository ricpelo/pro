Dibujar e implementar una jerarquía de clases con interfaces.
Las clases abstractas deberán aparecer en el diagrama con el estereotipo <<abstract>>.

Animal
-Vertebrado
--Anfibio
--Ave
--Mamifero
--Pez
--Reptil
Invertebrado

Interfaces:
- Oviparo: Métodos abstractos: ponerHuevos()
- Venenoso: Métodos abstractos: envenenar()

Un ornitorrinco es un mamífero ovíparo y venenoso. Los peces, aves, anfibios y reptiles son ovíparos.

Dibujar un diagrama de clases que represente dicha jerarquía colocando la clase Ornitorrinco en ella y las interfaces. Debes decidir cuales clases son abstractas y cuales concretas.

Completar el diagrama de clases incluyendo al menos 1 subclase concreta para las subclases de la clase Vertebrado (Pez, …)

Implementar ese diagrama de clases (incluye las interfaces)

Crear un método default llamado morder() en el interface Venenoso y comprobar que los objetos ornitorrinco disponen de él. Realizar un ejemplo donde se invoque el método morder().

Crear y probar un método estático (static) inventado por el alumno en alguna interface de este problema.

Crear y probar un método por defecto (default) inventado por el alumno en alguna interface de este problema.

Crear una interface Mostrable que incluya el método toString() y aplicarla a las clases que creas necesario para poder mostrar la lista de animales

Crear una lista de animales ovíparos (usar interface List con tipo Oviparo, y como implementación de la lista una ArrayList). Rellenar la lista con animales aleatorios.

Crear en la clase Principal un método llamado mostrarOviparos() que reciba una lista de animales usando como parámetro de dicho método la interface List y el tipo Animal como tipo de los objetos de la lista.

Usar el método mostrarOviparos para mostrar la lista de animales ovíparos creada anteriormente.
