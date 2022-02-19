class Availability < ApplicationRecord
  has_many :products
  validates :name, presence: true, length: { maximum: 1000 }
  validates :number_product, presence: true
  validates :status, presence: true
  after_create do
    Availability.find(id).update_attribute(:number_instock, number_product)
  end
  rails_admin do
    create do
      exclude_fields :product_sold
      field :status, :enum do
        enum do
          [['Instock', 1], ['Outstock', 0]]
        end
      end
    end
    edit do
      field :name
      field :number_product
      field :product_sold
      field :number_instock
      field :is_ordering
      field :status, :enum do
        enum do
          [['Instock', 1], ['Outstock', 0]]
        end
      end
      field :products
    end
    list do
      field :id
      field :name
      field :number_product
      field :number_instock
      field :product_sold
      field :is_ordering
      field :status, :enum do
        enum do
          [['Instock', 1], ['Outstock', 0]]
        end
      end
      field :created_at
      field :updated_at
    end
  end
end
