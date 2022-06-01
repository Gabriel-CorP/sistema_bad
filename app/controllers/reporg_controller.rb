class ReporgController < ApplicationController
    def productos_ordenados
        sql="CALL `proc_productos_ordenados`()" 
        @array = ActiveRecord::Base.connection.execute(sql).to_a
    end

    

    def compras_categorias
        sql="CALL `proc_montos_por_categorias`()" 
        @array = ActiveRecord::Base.connection.execute(sql).to_a
    end



end
