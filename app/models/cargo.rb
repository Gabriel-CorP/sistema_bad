class Cargo < ApplicationRecord
    has_one :division
    validates_presence_of :nombre,presence:true,:message =>"-> El nombre del cargo debe ser digitado"
end
