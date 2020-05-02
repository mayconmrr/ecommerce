# frozen_string_literal: true

class Backoffice::CategoriesController::CategoryService
  attr_accessor :category

  def self.create(params_category)
    @category = Category.new(params_category)
    @category.save! if @category.valid?
    @category
  end
end
