object neo { 
  var energia = 100
  method saltar() {
        energia = energia * 0.5
  }
  method vitalidad(){
    return energia / 10
  }
  method esElegido() {
    return true 
  }
  method subirALaNave() {
    nave.subirA(self)
  }
  method bajarDeLaNave() {
    nave.bajarA(self)
  }
}
object morfeo {
    var vitalidad = 8
    var cansado = false
    method saltar() {
        vitalidad = (vitalidad - 1).max(0)
        cansado = not cansado
    }
    method esElegido() {
        return false 
    }
    method vitalidad(){
        return vitalidad
    }
  method subirALaNave() {
        nave.subirA(self)
    }
    method bajarDeLaNave() {
        nave.bajarA(self)
  }  
}
object trinity {
    method vitalidad() {
        return 0
    }
    method esElegido() {
        return false 
  }
    method saltar(){
    // no hace nada en HD}
    }
    method subirALaNave() {
        nave.subirA(self)
  }
    method bajarDeLaNave() {
        nave.bajarA(self)
  }
}

object nave {
    const property pasajeros = [neo, morfeo, trinity]
    method subirA(unPasajero) {
        if(self.estaEnNave(unPasajero))
            self.error("El pasajero ya se encuentra en la nave")
        pasajeros.add(unPasajero)
    }
    method bajarA(unPasajero) {
        if(self.estaEnNave(unPasajero))
            self.error("El pasajero no estaen a nave")
        pasajeros.remove(unPasajero)
    }
     method estaEnNave(unPasajero){
        return pasajeros.contains(unPasajero)
    }
    method VitalidadMaximaPasajero() {
        return pasajeros.max({p => p.vitalidad()})
    }
    method elegidoEstaEnNave() {
        return pasajeros.any({p => p.esElegido()})
    }
    method cantidadPasajeros() {
        return pasajeros.size()
    }
    method chochar(){
        pasajeros.forEach({p => p.saltar()})
        // pasajeros.clear() más fácil
        pasajeros.forEach({p=> self.bajarA(p)}) 
    }
    method acelerar() {
        self.losQueNoSonElegido().forEach({p =>p.saltar()})
    }
    method losQueNoSonElegido(){
        return pasajeros.filter({p => !p.esElegido()})
    }
}