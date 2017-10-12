class Provider < ActiveRecord::Base
  enum priority: [:contract, :individual_sale]
  has_many :warehouse_items, through: :warehouse_item_providers
  has_many :warehouse_item_providers
  # cambien el nombre de la relacion para que matchee 
  # con su modelo que guarda el nombre de los productos
  # igual tienen que hacer una join table que guarde el id de este
  # modelo y el del producto asociado

  validates :name,uniqueness: true # verifiquen que funcione
 
  before_validation :set_name

  scope :active, -> { where(active: true) }# el scope debe buscar los que tengan active: true
 
  def set_name

    while Provider.where(name: self.name).count > 0 do
      self.name = "#{self.name}_1"
    end
    # hagan que busque los que tengan el mismo nombre que se intenta guardar
    # agregue "_1" al name si ya hay alguno con el nombre no 
    # importa que ya tenga "_1" le agregarian otro, ej. "steren_1_1"
    # self.name entrega el nombre que esta tratandose 
    # de asignar al objeto instanciado
  end

  def self.find_by_product_prioritized(item_id)
    #WarehouseItem.find(item_id).providers.where(priority: 0)
    self.joins(warehouse_item_providers: :warehouse_item).
      where("warehouse_items.id = #{item_id}").order(priority: :asc)
    # este metodo va a cargar un proveedor bajo las condiciones:
    # debe estar relacionado con el id del producto que se esta pasando
    # en el argumento y debe cargar basado en la prioridad del campo
    # priority, este campo es un campo enumerado con 2 posibles valores
    # vean los docs de "enum" (ya lo han hecho antes)
    # el valor de :contract es el de mayor prioridad y :individual_sale
    # el de menor prioridad. Usen ".joins()" 
    # NOTE: este metodo es de clase
  end

end
