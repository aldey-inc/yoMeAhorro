# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150809001750) do

  create_table "clasificaciones", force: :cascade do |t|
    t.string  "nombre",      limit: 255,                       null: false
    t.string  "imagen",      limit: 255
    t.text    "descripcion", limit: 4294967295
    t.string  "color",       limit: 50
    t.boolean "activa",      limit: 1,          default: true
  end

  create_table "empresas", force: :cascade do |t|
    t.string "nombre",      limit: 255,        null: false
    t.text   "descripcion", limit: 4294967295
    t.string "direccion",   limit: 255
  end

  create_table "listas", force: :cascade do |t|
    t.integer  "usuario_id",  limit: 4, null: false
    t.integer  "producto_id", limit: 4, null: false
    t.datetime "listas_at",             null: false
  end

  add_index "listas", ["producto_id"], name: "fk_lista_de_compras_Productos1_idx", using: :btree
  add_index "listas", ["usuario_id"], name: "fk_Lista_de_compras_Usuarios1_idx", using: :btree

  create_table "marcas", force: :cascade do |t|
    t.string  "nombre",     limit: 255, null: false
    t.integer "empresa_id", limit: 4,   null: false
    t.string  "imagen",     limit: 255
  end

  add_index "marcas", ["empresa_id"], name: "fk_Marca_Empresas1_idx", using: :btree

  create_table "productos", force: :cascade do |t|
    t.integer "marca_id",                  limit: 4,                                            null: false
    t.string  "descripcion",               limit: 255
    t.string  "codigo_de_barras",          limit: 255
    t.boolean "tiene_peso",                limit: 1,                            default: false, null: false
    t.decimal "peso",                                  precision: 15, scale: 3, default: 0.0,   null: false
    t.boolean "tiene_longitud",            limit: 1,                            default: false, null: false
    t.decimal "longitud",                              precision: 15, scale: 3, default: 0.0,   null: false
    t.boolean "tiene_volumen",             limit: 1,                            default: false, null: false
    t.decimal "volumen",                               precision: 15, scale: 3, default: 0.0,   null: false
    t.string  "unidades",                  limit: 255
    t.boolean "tiene_numero_de_productos", limit: 1,                            default: false, null: false
    t.integer "numero_de_productos",       limit: 4,                            default: 0,     null: false
    t.boolean "tiene_numero_de_paquetes",  limit: 1,                            default: false, null: false
    t.integer "numero_de_paquetes",        limit: 4,                            default: 0,     null: false
    t.integer "clasificacion_id",          limit: 4,                                            null: false
    t.decimal "puntuacion",                            precision: 5,  scale: 2, default: 0.0,   null: false
    t.decimal "numero_personas",                       precision: 5,  scale: 2, default: 0.0,   null: false
  end

  add_index "productos", ["clasificacion_id"], name: "fk_Producto_Categoria1_idx", using: :btree
  add_index "productos", ["codigo_de_barras"], name: "codigoDeBarras_UNIQUE", unique: true, using: :btree
  add_index "productos", ["marca_id"], name: "fk_Productos_Marca1_idx", using: :btree

  create_table "puntuaciones", force: :cascade do |t|
    t.decimal "valor",                          precision: 5, scale: 2, default: 5.0, null: false
    t.text    "comentario",  limit: 4294967295
    t.integer "usuario_id",  limit: 4,                                                null: false
    t.integer "producto_id", limit: 4,                                                null: false
  end

  add_index "puntuaciones", ["producto_id"], name: "fk_puntuacions_productos1_idx", using: :btree
  add_index "puntuaciones", ["usuario_id"], name: "fk_puntuacions_usuarios1_idx", using: :btree

  create_table "registros", force: :cascade do |t|
    t.decimal  "cantidad",              precision: 15, scale: 3,  default: 0.0
    t.datetime "registro_at"
    t.integer  "usuario_id",  limit: 4,                                         null: false
    t.decimal  "longitud",              precision: 20, scale: 16
    t.decimal  "latitud",               precision: 20, scale: 16
    t.decimal  "altitud",               precision: 20, scale: 16, default: 0.0
    t.integer  "producto_id", limit: 4,                                         null: false
    t.decimal  "precio",                precision: 12, scale: 2
    t.integer  "puntuacion",  limit: 4
    t.integer  "tienda_id",   limit: 4,                                         null: false
  end

  add_index "registros", ["producto_id"], name: "fk_Registro_Producto1_idx", using: :btree
  add_index "registros", ["tienda_id"], name: "fk_Registro_Tienda1_idx", using: :btree
  add_index "registros", ["usuario_id"], name: "fk_Registro_Usuario1_idx", using: :btree

  create_table "tiendas", force: :cascade do |t|
    t.string  "nombre",    limit: 255,                                                null: false
    t.string  "sucursal",  limit: 45
    t.string  "imagen",    limit: 45
    t.decimal "longitud",                     precision: 20, scale: 16, default: 0.0, null: false
    t.decimal "altitud",                      precision: 20, scale: 16, default: 0.0, null: false
    t.decimal "latitud",                      precision: 20, scale: 16, default: 0.0, null: false
    t.text    "direccion", limit: 4294967295
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "nombre",          limit: 255,                                         null: false
    t.string   "apellido",        limit: 255
    t.string   "email",           limit: 255,                                         null: false
    t.string   "password",        limit: 255
    t.string   "color",           limit: 255
    t.string   "imagen",          limit: 255
    t.string   "rfc",             limit: 255
    t.string   "curp",            limit: 255
    t.string   "avatar",          limit: 255
    t.decimal  "longitud",                    precision: 20, scale: 16, default: 0.0
    t.decimal  "latitud",                     precision: 20, scale: 16, default: 0.0
    t.decimal  "altitud",                     precision: 20, scale: 16, default: 0.0
    t.datetime "ultima_conexion",                                                     null: false
    t.integer  "reputacion",      limit: 4,                             default: 5,   null: false
  end

  add_foreign_key "listas", "productos", name: "fk_lista_de_compras_Productos1"
  add_foreign_key "listas", "usuarios", name: "fk_Lista_de_compras_Usuarios1"
  add_foreign_key "marcas", "empresas", name: "fk_Marca_Empresas1"
  add_foreign_key "productos", "clasificaciones", column: "clasificacion_id", name: "fk_Producto_Categoria1"
  add_foreign_key "productos", "marcas", name: "fk_Productos_Marca1"
  add_foreign_key "puntuaciones", "productos", name: "fk_puntuacions_productos1"
  add_foreign_key "puntuaciones", "usuarios", name: "fk_puntuacions_usuarios1"
  add_foreign_key "registros", "productos", name: "fk_Registro_Producto1"
  add_foreign_key "registros", "tiendas", name: "fk_Registro_Tienda1"
  add_foreign_key "registros", "usuarios", name: "fk_Registro_Usuario1"
end
