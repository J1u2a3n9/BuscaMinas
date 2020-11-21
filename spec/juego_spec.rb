require 'juego.rb'


RSpec.describe Juego do
    @@juego=Juego.new() 
    #it 'deberia devolver un elemento de una casilla colocando x y y ' do
       #expect(@@juego.click(1,4)).to eq(' ')
    #end

    it 'deberia devolver "Fuera de rango" si coloco la posicion x de una casilla que no existe' do
        expect(@@juego.click(10,4)).to eq('Fuera de rango')
    end

    it 'deberia devolver "Fuera de rango" si coloco la posicion y de una casilla que no existe' do
        expect(@@juego.click(4,10)).to eq('Fuera de rango')
    end

    it 'deberia devolver fuera de rango si las posiciones x y y estan fuera de los rangos' do
        expect(@@juego.click(20,10)).to eq('Fuera de rango')
    end

    it 'deberia devolver un "*" si seleccione la posicion x y y de la bomba' do
        expect(@@juego.click(7,2)).to eq('*')
    end

    
    it 'deberia devolver un "*" si seleccione la posicion x y y de la bomba' do
        expect(@@juego.click(3,8)).to eq('*')
    end

    it 'deberia devolver un "-" si seleccione la posicion x y y que no tenga bomba ni numero II' do
       expect(@@juego.click(5,5)).to eq('-')
    end

    it 'deberia devolver un "-" si seleccione la posicion x y y que no tenga bomba ni numero' do
        expect(@@juego.click(0,0)).to eq('-')
    end
    
    it 'deberia devolver un "1" si he seleccionado la casilla 0 5 ' do
        expect(@@juego.click(0,5)).to eq('1')
    end

    it 'deberia devolver un "1"  si se ha seleccionado la casilla colocando 1 4 ' do
       expect(@@juego.click(1,4)).to eq('1')
    end

    it 'deberia devolver un "2"  si se ha seleccionado la casilla colocando  2 3 ' do
        expect(@@juego.click(2,3)).to eq('2')
    end

    it 'deberia devolver un "3"  si se ha seleccionado la casilla colocando 4 2 ' do
        expect(@@juego.click(4,2)).to eq('3')
    end

    it 'deberia devolver "Perdiste :(" si se ha seleccionado una casilla con bomba ' do
        expect(@@juego.recorristeTablero(3,8)).to eq('Perdiste :(')
    end
    
    it 'deberia devolver el tamaño en x del tablero que ingrese ' do
        @@juego.guardarTamaño(4,4)
        expect(@@juego.devolverX()).to eq(4)
    end

    it 'deberia devolver true si guarda el tamaño ingresado de mi matriz en las cordenadas de x ' do
        expect(@@juego.guardarTamaño(4,4)).to eq(true)
    end

    it 'deberia devolver el tamaño en y del tablero que ingrese ' do
        @@juego.guardarTamaño(5,5)
        expect(@@juego.devolverY()).to eq(5)
    end

    it 'deberia devolver true si guarda el tamaño ingresado de mi matriz en las cordenadas de y' do
        expect(@@juego.guardarTamaño(5,5)).to eq(true)
    end

    it 'deberia darme un mensaje de excepcion que diga si ingrese numeros fuera del limite de mi matriz ' do
        @@juego.guardarTamaño(10,10)
        expect(@@juego.FueraDelimite(11,11)).to eq(true)
    end

    it 'deberia darme false si ingreso una matriz que no es cuadratica ' do
        @@juego.guardarTamaño(5,6)
        expect(@@juego.controlTamañoTablero(5,6)).to eq(false)
    end

    it 'deberia darme false si coloco mas cantidad de minas de las especificadas' do
        @@juego.guardarTamaño(4,4)
        @@juego.controlPonerMinas()
        @@juego.controlPonerMinas()
        @@juego.controlPonerMinas()
        @@juego.controlPonerMinas()
        @@juego.controlPonerMinas()
        expect(@@juego.controlPonerMinas()).to eq(false)
    end

    it 'deberia devolverme true en la posicion que puse una bomba' do
        @@juego.guardarTamaño(4,4)
        @@juego.insertarBomba(0,0)
        expect(@@juego.esBomba(0,0)).to eq(true)
    end

    
    it 'deberia devolverme false en la posicion que puse una bomba' do
        @@juego.guardarTamaño(4,4)
        @@juego.insertarBomba(0,0)
        expect(@@juego.esBomba(1,2)).to eq(false)
    end
    






        






    






   
end