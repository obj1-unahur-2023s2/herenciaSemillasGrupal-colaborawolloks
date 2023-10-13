import parcelas.*

class Planta {
	const anioSemilla
	const property altura
	
	method horasDeSol()
	method esFuerte() = self.horasDeSol() > 10
	method daNuevasSemillas() = self.esFuerte() or self.condicionAlternativa()
	method condicionAlternativa()
	// no olvidar el método espacioQueOcupa()
	method esIdeal(unUnaParcela)
	
}

class Menta inherits Planta {
	override method horasDeSol() = 6
	override method condicionAlternativa() = altura > 0.4
	method espacioQueOcupa() = altura * 3
	override method esIdeal(unaParcela) = unaParcela.superficie() > 6 
}

class Soja inherits Planta {
	override method horasDeSol() {
		return if(altura < 0.5) {6}
		else if(altura < 1) {7}
		else {9}
	}
	override method condicionAlternativa() = altura >= 1 and anioSemilla > 2007
	method espacioQueOcupa() = altura * 0.5
	override method esIdeal(unaParcela) = self.horasDeSol() == unaParcela.horasDeSol()
}

class Quinoa inherits Planta {
	const property horasDeSol
	
	override method condicionAlternativa() = anioSemilla < 2005
	method espacioQueOcupa() = 0.5
	override method esIdeal(unaParcela) = unaParcela.plantasBajitas()
	
}

class SojaTransgenica inherits Soja {
	override method daNuevasSemillas() = false
	override method esIdeal(unaParcela) = unaParcela.cantidadMaximaDePlantas() == 1
}

class HierbaBuena inherits Menta {
	override method espacioQueOcupa() = super() * 2
}