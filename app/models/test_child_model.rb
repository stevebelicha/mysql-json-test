class TestChildModel < ActiveRecord::Base
  belongs_to :parent, class_name: TestParentModel, inverse_of: :children
end
