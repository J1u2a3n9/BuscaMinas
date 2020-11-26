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
    erb :FormularioInicial
end
post '/Juego_Clasico' do
    erb :Clasico
end
post '/juegoFacil' do
    $nombre=params[:nombre]
    if($nombre=="")
        erb :Clasico
    else
        $juego = Juego.new(9,9)
        erb :ColocarBombas
    end
    
end

post '/marcarBombas' do
    @posX=params[:x].to_i
    @posY=params[:y].to_i
    @res=$juego.agregarBombas(@posX,@posY)
    erb :ColocarBombas
end
post '/empezarJuego' do
    $juego.establecerNumeros()
    erb :tablero
end

post '/marcar' do
    @posX=params[:x].to_i
    @posY=params[:y].to_i
    @res=$juego.marcarCasilla(@posX,@posY)
    
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

post '/Interfaz_personalizado' do
    erb:Personalizado_int
end
post '/personalizado' do
    $nombre=params[:nombre]
    if($nombre=="")
        erb:Personalizado_int
    else
        $nombre=params[:nombre]
        @validacion=false
        @filas=params[:fil].to_i
        @columnas=params[:colum].to_i
        if @filas <= 1 || @columnas <= 1
            @validacion=true
            erb :Personalizado_int
        else
            $juego = Juego.new(@filas,@columnas)
            erb :ColocarBombas
        end
    end
end

post '/marcar_Bandera' do
    @posX=params[:x].to_i
    @posY=params[:y].to_i
    $juego.marcarBandera(@posX,@posY)
    erb:tablero
end
post '/desmarcar_Bandera' do
    @posX=params[:x].to_i
    @posY=params[:y].to_i
    $juego.desmarcar_Bandera(@posX,@posY)
    erb:tablero
end


post '/volverAjugar' do
    erb :FormularioInicial
end