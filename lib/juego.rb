class Juego
    @@contador=0
    def initialize()
        @matriz= Array.new(9) { Array.new(9) { ' ' } }
    end

    def pintar(posicionX,posicionY,caracter)
        @matriz[posicionX.to_i][posicionY.to_i]=caracter
    end

    def get()
        return @matriz
    end

    def mostrarBomba(posicionX,posicionY) 
        if (posicionX.to_i==1 && posicionY.to_i==6 || posicionX.to_i==2 && posicionY.to_i==4 || posicionX.to_i==3 && posicionY.to_i==3 || posicionX.to_i==3 && posicionY.to_i==6 || posicionX.to_i==3 && posicionY.to_i==8 || posicionX.to_i==4 && posicionY.to_i==1 ||  posicionX.to_i==5 && posicionY.to_i==1 || posicionX.to_i==6 && posicionY.to_i==8 || posicionX.to_i==7 && posicionY.to_i==1 || posicionX.to_i==7 && posicionY.to_i==2  )
            return '*'
        end
    end

    def mostrarEspaciosVacios(posicionX,posicionY) 
        if ( posicionX.to_i==0 && posicionY.to_i==0 || posicionX.to_i==0 && posicionY.to_i==1 || posicionX.to_i==0 && posicionY.to_i==2 || posicionX.to_i==0 && posicionY.to_i==3  || posicionX.to_i==0 && posicionY.to_i==8 ||  posicionX.to_i==1 && posicionY.to_i==0 || posicionX.to_i==1 && posicionY.to_i==1 || posicionX.to_i==1 && posicionY.to_i==2 || posicionX.to_i==1 && posicionY.to_i==8 || posicionX.to_i==2 && posicionY.to_i==0 || posicionX.to_i==2 && posicionY.to_i==1 || posicionX.to_i==5 && posicionY.to_i==3  || posicionX.to_i==5 && posicionY.to_i==4 || posicionX.to_i==5 && posicionY.to_i==5 || posicionX.to_i==5 && posicionY.to_i==6 || posicionX.to_i==6 && posicionY.to_i==4 || posicionX.to_i==6 && posicionY.to_i==5 || posicionX.to_i==6 && posicionY.to_i==6 || posicionX.to_i==7 && posicionY.to_i==4 || posicionX.to_i==7 && posicionY.to_i==5 ||   posicionX.to_i==7 && posicionY.to_i==6 ||  posicionX.to_i==8 && posicionY.to_i==4 || posicionX.to_i==8 && posicionY.to_i==5 || posicionX.to_i==8 && posicionY.to_i==6 || posicionX.to_i==8 && posicionY.to_i==7 || posicionX.to_i==8 && posicionY.to_i==8)
            return '-'
        end
    end

    def mostrarNumeros(posicionX,posicionY)
        if (posicionX.to_i==0 && posicionY.to_i==5 || posicionX.to_i==0 && posicionY.to_i==6 || posicionX.to_i==0 && posicionY.to_i==7 || posicionX.to_i==1 && posicionY.to_i==3 || posicionX.to_i==1 && posicionY.to_i==4 || posicionX.to_i==1 && posicionY.to_i==7 ||  posicionX.to_i==2 && posicionY.to_i==2 || posicionX.to_i==2 && posicionY.to_i==8 || posicionX.to_i==3 && posicionY.to_i==0 || posicionX.to_i==3 && posicionY.to_i==1 || posicionX.to_i==4 && posicionY.to_i==3 || posicionX.to_i==4 && posicionY.to_i==4 || posicionX.to_i==4 && posicionY.to_i==5  || posicionX.to_i==4 && posicionY.to_i==6 || posicionX.to_i==4 && posicionY.to_i==8 || posicionX.to_i==5 && posicionY.to_i==7 || posicionX.to_i==5 && posicionY.to_i==8 || posicionX.to_i==6 && posicionY.to_i==3 || posicionX.to_i==6 && posicionY.to_i==7 || posicionX.to_i==7 && posicionY.to_i==0 || posicionX.to_i==7 && posicionY.to_i==3 ||   posicionX.to_i==7 && posicionY.to_i==7 ||  posicionX.to_i==7 && posicionY.to_i==8 || posicionX.to_i==8 && posicionY.to_i==0 || posicionX.to_i==8 && posicionY.to_i==3 )
             respuesta='1'
        end
        if (posicionX.to_i==1 && posicionY.to_i==5 || posicionX.to_i==2 && posicionY.to_i==3 || posicionX.to_i==2 && posicionY.to_i==6 || posicionX.to_i==3 && posicionY.to_i==2 || posicionX.to_i==3 && posicionY.to_i==4 || posicionX.to_i==3 && posicionY.to_i==5 ||  posicionX.to_i==3 && posicionY.to_i==7 || posicionX.to_i==4 && posicionY.to_i==0 || posicionX.to_i==4 && posicionY.to_i==7 || posicionX.to_i==5 && posicionY.to_i==0 || posicionX.to_i==5 && posicionY.to_i==2 || posicionX.to_i==6 && posicionY.to_i==0 || posicionX.to_i==8 && posicionY.to_i==1  || posicionX.to_i==8 && posicionY.to_i==2 )
            respuesta='2'
        end
        if (posicionX.to_i==2 && posicionY.to_i==5 || posicionX.to_i==2 && posicionY.to_i==7 || posicionX.to_i==4 && posicionY.to_i==2 || posicionX.to_i==6 && posicionY.to_i==1 || posicionX.to_i==6 && posicionY.to_i==2 )
            respuesta='3'
        end

        return respuesta
    end






    def click(posicionX,posicionY)
        if (posicionX.to_i>9 || posicionY.to_i>9)
            respuesta='Fuera de rango'
        else
            if mostrarBomba(posicionX,posicionY) == '*'
                respuesta='*'
            else 
                if mostrarEspaciosVacios(posicionX,posicionY)=='-'
                    respuesta='-'
                else
                    respuesta=mostrarNumeros(posicionX,posicionY)
                end
            end
        end
        return respuesta
    end


    def devuelveResultado(respuesta)
        if (respuesta==false)
            return 'Perdiste :('
        else
            return 'Ganaste :)'
        end
    end

    def recorristeTablero(posicionX,posicionY)
        if (mostrarBomba(posicionX,posicionY)=='*')
            @@contador=@@contador-1
            respuestas=devuelveResultado(false)
        end
        if (mostrarEspaciosVacios(posicionX,posicionY)=='-' || mostrarNumeros(posicionX,posicionY)=='1'|| mostrarNumeros(posicionX,posicionY)=='2'|| mostrarNumeros(posicionX,posicionY)=='3')
            @@contador=@@contador+1
        end
        if(@@contador==71)
            respuestas=devuelveResultado(true)
        end
        return respuestas
    end


 









end

