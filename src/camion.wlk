import cosas.*

object camion {
	const property cosas = []
	const toneladasSoportadas = 2500 
	const tara = 1000

	method pesoMaximoSoportado() {
	  return toneladasSoportadas - self.pesoTotalCargado()
	}
	
	method validarCarga(cosa){
		
		if (cosa.peso() > self.pesoMaximoSoportado()){ 
			self.error("El peso es mayor al soportado")
		}
	}

	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
	 return cosas.all({cosa=> cosa.nivelPeligrosidad()<=nivelMaximoPeligrosidad}) 
	}
	method validarSiEsta(cosa) {
	  if (not cosas.contains(cosa)){
		self.error("No esta el elemento en el camion")
	  }
	}

	method pesoTotal() {
	  return self.pesoTotalCargado() + tara
	}

	method excedidoDePeso() {
	  return self.pesoTotalCargado() > self.pesoMaximoSoportado()
	}
	// method objetosPeligrosos(nivel) {
	//	return cosas.count({cosa => cosas.nivelPeligrosidad() > nivel})
	  
	//}

	method objetosPeligrosos(nivel){
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})

	}
	method objetosMasPeligrososQue(cosaAEvaluar){
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > cosaAEvaluar.nivelPeligrosidad()})
		
	}
	method pesoTotalCargado() {
	  return cosas.sum({cosa => cosa.peso()})
	}

	method descargar(unaCosa) {
		self.validarSiEsta(unaCosa)
		cosas.remove(unaCosa)
		
	}
	method cargar(unaCosa) {
		self.validarCarga(unaCosa)
		cosas.add(unaCosa)
		unaCosa.modificar()
	}
	method tieneAlgoQuePesaEntre(min, max) {
	  return cosas.any({cosa => cosa.peso()>min && cosa.peso()<max})
	}
	method cosaMasPesada() {
	  return cosas.max({cosa=>cosa.peso()})
	}

	method totalBultos() {
	  return cosas.sum({ cosa=>cosa.bultos() })
	}
}
