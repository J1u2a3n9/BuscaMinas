require 'sinatra'
require './lib/juego'
require './config'

get '/' do
    erb :inicio
end


post '/juego' do
    $juego = Juego.new
    erb :tablero
end

post '/seleccionar' do
    $posicionX=params[:x]
    $posicionY=params[:y]
    $respuesta=$juego.click($posicionX,$posicionY)
    $resultadoJuego=$juego.recorristeTablero($posicionX,$posicionY)
    erb :seleccionaPosicion
end

post '/volverAjugar' do
    $juego = Juego.new
    erb :tablero
end


