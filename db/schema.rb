# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_17_030111) do
  create_table "active_storage_attachments", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "cargos", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cotizacions", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "proveedor_id", null: false
    t.float "descuento_efectivo"
    t.float "descuento_pronto_pago"
    t.float "descuento_volumen"
    t.float "descuento_forma_pago"
    t.float "envases_embalage"
    t.float "pago_transporte"
    t.float "recargo_aplazamiento"
    t.string "estado"
    t.float "total"
    t.date "fecha_realizacion"
    t.date "fecha_entrega"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proveedor_id"], name: "index_cotizacions_on_proveedor_id"
  end

  create_table "divisions", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre_empleado"
    t.bigint "proveedor_id", null: false
    t.bigint "cargo_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cargo_id"], name: "index_divisions_on_cargo_id"
    t.index ["proveedor_id"], name: "index_divisions_on_proveedor_id"
  end

  create_table "evaluacions", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "proveedor_id", null: false
    t.string "pregunta"
    t.float "calificacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proveedor_id"], name: "index_evaluacions_on_proveedor_id"
  end

  create_table "linea_cotizacions", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "linea_requesicion_id", null: false
    t.bigint "cotizacion_id", null: false
    t.float "precio_unitario"
    t.float "subtotal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cotizacion_id"], name: "index_linea_cotizacions_on_cotizacion_id"
    t.index ["linea_requesicion_id"], name: "index_linea_cotizacions_on_linea_requesicion_id"
  end

  create_table "linea_requesicions", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "producto_id", null: false
    t.bigint "requesicion_id", null: false
    t.string "cantidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["producto_id"], name: "index_linea_requesicions_on_producto_id"
    t.index ["requesicion_id"], name: "index_linea_requesicions_on_requesicion_id"
  end

  create_table "permisos", charset: "utf8mb4", force: :cascade do |t|
    t.string "permiso"
    t.bigint "rol_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rol_id"], name: "index_permisos_on_rol_id"
  end

  create_table "productos", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.string "presentacion"
    t.float "precio"
    t.string "imagen"
    t.float "existencias"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tipo_producto_id", null: false
    t.index ["tipo_producto_id"], name: "index_productos_on_tipo_producto_id"
  end

  create_table "proveedors", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "usuario_id", null: false
    t.string "compania"
    t.string "representante_legal"
    t.string "direccion"
    t.string "telefono"
    t.string "fax"
    t.string "celular"
    t.string "nombre_contacto"
    t.string "web_site"
    t.string "nrc"
    t.string "anios"
    t.string "rubro"
    t.string "logo"
    t.string "escritura_constitucion"
    t.string "img_ubicacion_sucursales"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_proveedors_on_usuario_id"
  end

  create_table "references", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "proveedor_id", null: false
    t.string "nombre_entidad"
    t.string "nombre_contacto"
    t.string "telefono_contacto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proveedor_id"], name: "index_references_on_proveedor_id"
  end

  create_table "requesicions", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "usuario_id", null: false
    t.date "fecha_solicitud"
    t.date "fecha_entrega"
    t.string "estado"
    t.string "observacion"
    t.string "prioridad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_requesicions_on_usuario_id"
  end

  create_table "rols", charset: "utf8mb4", force: :cascade do |t|
    t.string "rol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_productos", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ubicacions", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre"
    t.string "direccion"
    t.bigint "proveedor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proveedor_id"], name: "index_ubicacions_on_proveedor_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "user"
    t.string "password_digest"
    t.string "intentos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.integer "edad"
    t.string "dui"
    t.string "isss"
    t.string "afp"
    t.bigint "user_id", null: false
    t.bigint "rol_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rol_id"], name: "index_usuarios_on_rol_id"
    t.index ["user_id"], name: "index_usuarios_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cotizacions", "proveedors"
  add_foreign_key "divisions", "cargos"
  add_foreign_key "divisions", "proveedors"
  add_foreign_key "evaluacions", "proveedors"
  add_foreign_key "linea_cotizacions", "cotizacions"
  add_foreign_key "linea_cotizacions", "linea_requesicions"
  add_foreign_key "linea_requesicions", "productos"
  add_foreign_key "linea_requesicions", "requesicions"
  add_foreign_key "permisos", "rols"
  add_foreign_key "productos", "tipo_productos"
  add_foreign_key "proveedors", "usuarios"
  add_foreign_key "references", "proveedors"
  add_foreign_key "requesicions", "usuarios"
  add_foreign_key "ubicacions", "proveedors"
  add_foreign_key "usuarios", "rols"
  add_foreign_key "usuarios", "users"
end
