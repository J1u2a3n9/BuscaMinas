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
    




        






    






   
end