object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bultos() = 1
	method modificar(){

	}
}

object bumblebee {
	var transformadoEnAuto = false
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method bultos() = 2
	method modificar(){
		transformadoEnAuto = false
	}
}
object paqueteDeLadrillos {
	var property cantidadDeLadrillos = 0 

	method cantidadDeRefuerzos() {
		return if (cantidadDeLadrillos <= 1000) { 
			(cantidadDeLadrillos / 100).ceil() 
		} 
		else 
		{ (cantidadDeLadrillos / 50).ceil() 
		}
		 }

	method peso() {
		return (self.cantidadDeRefuerzos()*10) + (self.cantidadDeLadrillos() * 2)
  }
  	method nivelPeligrosidad() {
		return (50 - self.cantidadDeRefuerzos()).max(0)
  }
  method bultos() { return if (cantidadDeLadrillos <= 100) 1 else if (cantidadDeLadrillos <= 300) 2 else 3 }
	method modificar(){
		if (cantidadDeLadrillos - 12 > 0 ){
			cantidadDeLadrillos -= 12
		} else {
			cantidadDeLadrillos = 0
		}
	}
}

object arenaAGranel {
  var property peso = 0
  method peso() {
	return peso
  } 
  method nivelPeligrosidad() {
	return 1
  }
  method bultos() = 1
  method modificar(){
	if (peso - 15 > 0){
		peso -= 15	}
		else{
			peso = 0
		}
	}
}

object bateriaAntiAerea {
	var property tieneMisil = false 
	method peso() {  
		return if (tieneMisil){300} else{200}
		}
	method nivelPeligrosidad() {
	return if (tieneMisil){100} else {0}  
	}
	method bultos() = if (tieneMisil) 2 else 1

	method modificar(){
		tieneMisil = true
	}
}

object contenedorPortuario{
	var property cosas = []
	method peso(){
		return 100 + cosas.sum({cosa=>cosa.peso()})
	}

	method nivelPeligrosidad() {
	  return (cosas.max({cosa => cosa.nivelPeligrosidad()})).nivelPeligrosidad()
	}
	method agregarCosa(cosa) {
	  cosas.add(cosa)
	}
	method bultos() = 1 + cosas.sum({ cosa =>cosa.bultos() })

	method modificar(){
		cosas.forEach({cosa=>cosa.modificar()})
	}
}

object residuosRadiactivos {
  var property peso = 0
  method peso() {
	return peso
  } 
  method nivelpeligrosidad() {
	return 200
  }
  method bultos() = 1
  method modificar(){
	peso += 15
	}
}

object embalajeDeSeguridad {
  var property cosa = knightRider
  method peso(){
	return cosa.peso()
  }
  method nivelPeligrosidad() {
	return cosa.nivelDePeligrosidad().div(2)
  }
  method bultos() = 2
	method modificar(){

	}
}