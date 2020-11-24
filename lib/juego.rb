class Juego
    def initialize(fila,columna)
        @SIN_BOMBA = -2
        @BOMBA= -1
        @contJugadas=0
        @FUERA_TAB= 0
        @contBomba=0
        @fila=fila
        @columna=columna
        @campo= Array.new(fila) { Array.new(columna) { @SIN_BOMBA } } #backend  matris con los numeros y bomba back
        @jugadas=Array.new(fila) { Array.new(columna) { ' ' } } #frontend lo que muestas al usuario
        @vistaBom=Array.new(fila) { Array.new(columna) { ' ' } }#backend de las bombas para que simule el marcado cuando marcas bombas
        for i in 0..fila-1
            for j in 0..columna-1
                @vistaBom[i][j]="X:"+i.to_s+" "+"Y:"+j.to_s 
            end
        end
    end
    def getCampo()
        return @campo
    end

    def getJugadas()
        return @jugadas
    end
    def getVistaBom()
        return @vistaBom
    end
    def getfila
        return @fila
    end
    def getcolumna
        return @columna
    end
    def gano()
        if (@fila*@columna-@contBomba) == @contJugadas
            return true
        else
            return false
        end
    end
    def marcar(posx,posy) 
        if((posx>=0 && posx<@columna) && (posy>=0 && posy<@fila))   
            if @campo[posx][posy]==@BOMBA
                return @BOMBA
            else
                @contJugadas=@contJugadas+1
                @jugadas[posx][posy]=@campo[posx][posy]
                return @SIN_BOMBA
            end 
        else
            return @FUERA_TAB
        end
    end
    def agregarBombas(posx,posy)
        if((posx>=0 && posx<@columna) && (posy>=0 && posy<@fila))   
            @campo[posx][posy]=@BOMBA
            @vistaBom[posx][posy]='*'
            @contBomba=@contBomba+1
            return @BOMBA
        else
            return @FUERA_TAB
        end 
    end
    def contar2(x,y) #cuenta bombas al rededor
        nbombas = 0 
        for i in x-1..x+1 
            for j in y-1..y+1 
                if (i >= 0 && i < @fila) && (j >= 0 && j < @columna) 
                    if @campo[i][j] == @BOMBA #existe bomba
                        nbombas=nbombas+1 
                    end
                end
            end
        end
        return nbombas
    end
    def establecerNumeros() #le da numeros a la matriz pero antes tiene que haber bombas si no hay bombas toda la matris es 0
            for i in  0..@fila-1
                for j in 0..@columna-1
                    if @campo[i][j] == @SIN_BOMBA #no tiene bomba
                        @campo[i][j] = contar2(i,j)
                    end
                end
            end
    end
end