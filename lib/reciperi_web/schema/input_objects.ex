defmodule ReciperiWeb.Schema.InputObjects do
  @moduledoc false

  use Absinthe.Schema.Notation

  @desc "The field and direction to sort ingredients."
  input_object :ingredient_order do
    @desc "The field by which to sort."
    field :field, non_null(:ingredient_order_field), default_value: :name

    @desc "The sort direction."
    field :direction, non_null(:order_direction), default_value: :desc
  end

  @desc "Filtering criteria for post connections."
  input_object :ingredient_filter do
    field :name, :string
    @desc "Filter by created before"
    field :created_at_before, :time
    @desc "Filter by created after"
    field :created_at_after, :time
  end

  @desc "Ingredient's accepted fields on mutation"
  input_object :ingredient_input do
    field :name, non_null(:string)
    field :description, :string
    field :price, non_null(:decimal)
  end

  input_object :order_item_input do
    field :ingredient_id, non_null(:id)
    field :quantity, non_null(:integer)
  end

  input_object :place_order_input do
    field :customer_number, :integer
    field :ingredients, non_null(list_of(non_null(:order_item_input)))
  end
end
