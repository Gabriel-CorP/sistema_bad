class ReporgController < ApplicationController
    def productos_ordenados
        sql="SELECT p.id, p.nombre, p.presentacion, SUM(lr.cantidad)
        FROM cotizacions AS c INNER JOIN linea_cotizacions AS lc
        INNER JOIN linea_requesicions lr INNER JOIN productos p
        WHERE p.id =lr.producto_id AND lr.id=lc.linea_requesicion_id 
        AND lc.cotizacion_id= c.id
        AND   c.estado= 'Aprobado'
        GROUP BY p.id;" 
        @array = ActiveRecord::Base.connection.execute(sql)
    end

    

    def compras_categorias
        sql="SELECT ca.id, ca.nombre, SUM(lc.subtotal)
        FROM cotizacions AS c 
        INNER JOIN linea_cotizacions AS lc
        INNER JOIN linea_requesicions lr INNER JOIN productos p
        INNER JOIN tipo_productos AS ca 
        WHERE ca.id= p.tipo_producto_id  AND  p.id =lr.producto_id 
        AND lr.id=lc.linea_requesicion_id AND lc.cotizacion_id= c.id
        AND   c.estado= 'Aprobado'
        GROUP BY ca.id;" 
        @array = ActiveRecord::Base.connection.execute(sql)
    end



end
