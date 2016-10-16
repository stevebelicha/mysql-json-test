class TestParentModel < ActiveRecord::Base
  has_many :children, class_name: TestChildModel, autosave: true, inverse_of: :parent
end
