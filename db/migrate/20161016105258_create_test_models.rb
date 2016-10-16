class CreateTestModels < ActiveRecord::Migration
  def change

    create_table :test_parent_models do |t|
      t.string :name
    end

    create_table :test_child_models do |t|
      t.references :test_parent_model
      t.string :string_field
      t.text :text_field
      t.date :date_field
      t.decimal :decimal_field
      t.boolean :bool_field
      t.json :json_field
    end
  end
end
