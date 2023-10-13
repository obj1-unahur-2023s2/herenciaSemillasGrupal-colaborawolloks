import parcelas.*

object inta {
	const parcelas = []
	
	method promedioPlantasPorParcela() {return
		self.totalPlantas() / self.cantidadDeParcelas()
	}
	method cantidadDeParcelas() = parcelas.size()
	method totalPlantas() = parcelas.sum{parcela=>parcela.cantidadDePlantas()}
	
	method parcelaMasAutosustentable() {return
		self.parcelasConMasDe4Plantas().max{parcela=>parcela.porcentajePlantasBienAsociadas()}
	}
	method parcelasConMasDe4Plantas() = parcelas.filter{parcela=>parcela.cantidadDePlantas()>4}
	
}
