import semillas.*

class Parcela {
	const largo
	const ancho
	const property horasDeSol
	const plantas = []
	
	method superficie() = ancho * largo
	method cantidadMaximaDePlantas() = 
		if(ancho>largo) self.superficie()/5 else self.superficie()/3+largo
	method tieneComplicaciones() = plantas.any{p=>p.horasDeSol()<horasDeSol}
	method cantidadDePlantas() = plantas.size()
	method plantar(unaPlanta) {
		if(self.cantidadDePlantas()==self.cantidadMaximaDePlantas()) {
			self.error("Supera cantidad máxima de plantas, no se puede plantar más")
		}
		if(horasDeSol+2 < unaPlanta.horasDeSol()) {
			self.error("La planta no tolera la cantidad de horas de sol en la parcela")
		}
		plantas.add(unaPlanta)
	}
	
	method plantasBajitas() = plantas.all{p=>p.altura()<=1.5}
	method seAsociaBien(unaPlanta)
	method cantPlantasBienAsociadas() = plantas.count{planta=>self.seAsociaBien(planta)}
	method porcentajePlantasBienAsociadas() {return
		 self.cantPlantasBienAsociadas() * 100 / self.cantidadDePlantas()
		} 
}

class ParcelaEcologica inherits Parcela {
	override method seAsociaBien(unaPlanta) = !self.tieneComplicaciones() and unaPlanta.esIdeal(self)
}

class ParcelaIndustrial inherits Parcela {
	override method seAsociaBien(unaPlanta) = self.cantidadDePlantas() <= 2 and unaPlanta.esFuerte()
}