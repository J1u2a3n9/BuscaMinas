require 'sinatra'
require './lib/juego'
require './config'
#SIN_BOMBA = -2
#BOMBA= -1
#FUERA_TAB= 0
get '/' do
    erb :inicio
end
post '/form' do
    erb :Formulario
end

post '/juegoFacil' do
    $juego = Juego.new(9,9)
    erb :ColocarBombas
end

post '/marcarBombas' do
    @posX=params[:x].to_i
    @posY=params[:y].to_i

    @res=$juego.agregarBombas(@posX,@posY)

    erb :ColocarBombas
end
post '/empezarFacil' do
    $juego.establecerNumeros()
    erb :tablero
end

post '/marcar' do
    @posX=params[:x].to_i
    @posY=params[:y].to_i
    @res=$juego.marcar(@posX,@posY)
    
    if @res==-1
        erb:juegoterminado
    else
        if $juego.gano
            erb:gano
        else
            erb:tablero
        end
    end
   

end
post '/personalizado' do
    @filas=params[:fil].to_i
    @columnas=params[:colum].to_i
    $juego = Juego.new(@filas,@columnas)
    erb :ColocarBombas
end




post '/volverAjugar' do
    erb :Formulario
end


