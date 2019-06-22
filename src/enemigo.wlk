import wollok.game.*
import otros_obj.*

// NOTAS:

// Estos enemigos comparten las mismas caracteristicas pero van a diferir en la cantidad de vida y ataque que tienen, asi como tambien el objeto que 
// guarden. Uno de ellos va a tener una llave , para que el jugador se vea obligado a atacarlos.


class Enemigo inherits NoColisionable {

	var property hp
	var property atk
	var contador = 0 //cuando el contador llega a 3, ataca al personaje y reinicia el contador. Va sumando uno cada vez que recibe un ataque.
	
	var imagen 
	//var imagen = "golum.jpeg"
	method image() = imagen
	

	method serInteractuadoPor(jugador) {
		self.reciboAtaque(jugador)
	}
	
	method reciboAtaque(personaje) {
		hp -= personaje.ataque()
		contador += 1
		self.atacoSiEsPosible(personaje)

		if (not self.sigoVivo()) {
			self.morir()
		}
	}
	
	method atacoSiEsPosible(personaje){
		if (contador == 3 ) {
			self.ataco(personaje)
			contador = 0
			}
		}
	
	method ataco(personaje){
		      personaje.esAtacado(atk)
	}

	method sigoVivo() {
		return hp > 0
	}

	method morir() {
		game.removeVisual(self)
		observerEnemigos.eliminar(self)
	}

	

}


// Estos objetos son para que los diferentes enemigos hereden sus respectivas imagenes para usar de animaciones.

class Bowser inherits Enemigo {
	
	method imagenAtk() = "bowser_atk.png" //la imagen que se muestra cuando es atacado por el jugador
	
	
	method animacion() {
		if(imagen == "bowser1.png") {
		imagen = "bowser2.png"
		} else {
			imagen = "bowser1.png"
		}	
	}
}

class Zelda inherits Enemigo {

	method imagenAtk() = "zelda_atk.png" //la imagen que se muestra cuando es atacado por el jugador
	
	method animacion() {
		if(imagen == "zelda1.png") {
		imagen = "zelda2.png"
		} else {
			imagen = "zelda1.png"
		}	
	}

}

class Pacman inherits Enemigo {

	method imagenAtk() = "pacman_atk.png" //la imagen que se muestra cuando es atacado por el jugador
	
	
	method animacion() {
		if(imagen == "pacman1.png") {
		imagen = "pacman2.png"
		} else {
			imagen = "pacman1.png"
		}	
	}
}

class Metroid inherits Enemigo {

	method imagenAtk() = "metroid_atk.png" //la imagen que se muestra cuando es atacado por el jugador
	
	
	method animacion() {
		if(imagen == "metroid1.png") {
		imagen = "metroid2.png"
		} else {
			imagen = "metroid1.png"
		}	
	}
}

class Donkey inherits Enemigo {

	method imagenAtk() = "donkey_atk.png" //la imagen que se muestra cuando es atacado por el jugador
	
	
	method animacion() {
		if(imagen == "donkey1.png") {
		imagen = "donkey2.png"
		} else {
			imagen = "donkey1.png"
		}	
	}
}