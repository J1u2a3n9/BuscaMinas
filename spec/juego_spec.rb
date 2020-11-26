require 'juego.rb'

RSpec.describe Juego do
    it 'deberia devolverme el numero de filas que ingrese' do
        @juego=Juego.new(4,2)
        expect(@juego.getfila()).to eq(4)
    end

    it 'deberia devolverme el numero de columnas que ingrese ' do
        @juego=Juego.new(6,8)
        expect(@juego.getcolumna()).to eq(8)
    end

    it 'deberia mostrarme la matriz inicial de la partida' do
        @juego=Juego.new(3,3)
        expect(@juego.getJugadas()).to eq([[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]])
    end
   
   it 'deberia devolverme el contenido de la matriz en -2 que significa que no hay bombas' do    
       @juego=Juego.new(4,4)
       expect(@juego.getCampo()).to eq([[-2, -2, -2, -2], [-2, -2, -2, -2], [-2, -2, -2, -2], [-2, -2, -2, -2]])
   end

   it 'deberia devolverme inicialmente las posiciones de la matrizque que tendran la matriz de bombas sin bombas marcadas con *' do
       @juego=Juego.new(3,3)
       expect(@juego.getVistaBom()).to eq([["X:0 Y:0", "X:0 Y:1", "X:0 Y:2"], ["X:1 Y:0", "X:1 Y:1", "X:1 Y:2"], ["X:2 Y:0", "X:2 Y:1", "X:2 Y:2"]])
   end
   it 'deberia poder agregar la posicion de una bomba' do
       @juego=Juego.new(5,5)
       expect(@juego.agregarBombas(1,4)).to eq(-1)
   end

   it 'deberia devolverme 0 si puse la bomba en una posicion fuera de rango de mi matriz' do
       @juego=Juego.new(6,6)
       expect(@juego.agregarBombas(6,5)).to eq(0)
   end

   it 'deberia devolverme la cantidad de bombas que tengo alrededor de la posicion que ingrese' do
       @juego=Juego.new(5,5)
       @juego.agregarBombas(1,1)
       @juego.agregarBombas(1,3)
       expect(@juego.contar2(1,2)).to eq(2)
   end
   it 'deberia devolverme la cantidad de bombas que tengo alrededor de la posicion que ingrese' do
    @juego=Juego.new(5,5)
    @juego.agregarBombas(1,0)
    @juego.agregarBombas(0,1)
    @juego.agregarBombas(1,2)
    expect(@juego.contar2(1,1)).to eq(3)
    end
   it 'deberia devolverme la matriz que en la posicioon x=1 y=1 que tiene bomba a su alrededor deve estar con unos' do
       @juego=Juego.new(5,5)
       @juego.agregarBombas(1,1)
       @juego.establecerNumeros()
       expect(@juego.getCampo()).to eq([[1, 1, 1, 0, 0], [1, -1, 1, 0, 0], [1, 1, 1, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]])  
   end

   it 'deberia marcarme el espacio diciendo que no hay bomba mediante el numero -2 si toque una posicion vacia' do
       @juego=Juego.new(5,5)
       @juego.agregarBombas(1,1)
       @juego.agregarBombas(1,3)
       expect(@juego.marcarCasilla(4,4)).to eq(-2)
   end

   it 'deberia marcarme el espacio diciendo que esta fuera de rango si toque una posicion que esta fuera de los limites de mi matriz' do
    @juego=Juego.new(5,5)
    @juego.agregarBombas(1,1)
    @juego.agregarBombas(1,3)
    expect(@juego.marcarCasilla(6,6)).to eq(0)
   end


   it 'deberia marcarme el espacio diciendo que hay una bomba si toque una posicion que tiene una bomba' do
    @juego=Juego.new(5,5)
    @juego.agregarBombas(1,1)
    @juego.agregarBombas(1,3)
    expect(@juego.marcarCasilla(1,1)).to eq(-1)
   end

   it 'deberia mostrarme false si perdi el juego tocando una mina' do
       @juego=Juego.new(4,4)
       @juego.agregarBombas(2,2)
       @juego.agregarBombas(0,0)
       @juego.marcarCasilla(0,0)
       expect(@juego.gano()).to eq(false)
   end

   it 'deberia mostrarme true si gane el juego sin tocar ni una mina' do
        @juego=Juego.new(4,4)
       @juego.agregarBombas(2,2)
       @juego.agregarBombas(0,0)
       @juego.marcarCasilla(0,1)
       @juego.marcarCasilla(0,2)
       @juego.marcarCasilla(0,3)
       @juego.marcarCasilla(1,0)
       @juego.marcarCasilla(1,1)
       @juego.marcarCasilla(1,2)
       @juego.marcarCasilla(1,3)
       @juego.marcarCasilla(2,0)
       @juego.marcarCasilla(2,1)
       @juego.marcarCasilla(2,3)
       @juego.marcarCasilla(3,0)
       @juego.marcarCasilla(3,1)
       @juego.marcarCasilla(3,2)
       @juego.marcarCasilla(3,3)
       expect(@juego.gano()).to eq(true)
   end
   it 'deberia devolverme -4 si trato de poner una bomba en una casilla que ya tiene una ' do
        @juego=Juego.new(4,4)
        @juego.agregarBombas(2,2)
        @juego.agregarBombas(0,2)
        expect(@juego.agregarBombas(0,2)).to eq(-4)
    end
    it 'deberia devolverme -4 si seleccione una casilla que ya marque anteriormente' do
        @juego=Juego.new(4,4)
        @juego.agregarBombas(2,2)
        @juego.agregarBombas(0,2)
        @juego.marcarCasilla(0,1)
        expect(@juego.marcarCasilla(0,1)).to eq(-4)
    end

    it 'deberia devolverme -5 si llene toda mi matriz excepto un espacio con bombas ' do
        @juego=Juego.new(3,3)
        @juego.agregarBombas(0,0)
        @juego.agregarBombas(0,1)
        @juego.agregarBombas(0,2)
        @juego.agregarBombas(1,0)
        @juego.agregarBombas(1,1)
        @juego.agregarBombas(1,2)
        @juego.agregarBombas(2,0)
        @juego.agregarBombas(2,1)
        expect(@juego.agregarBombas(2,2)).to eq(-5)
    end

end

