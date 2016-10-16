class WelcomeController < ::ApplicationController

  # Show a console
  def index
    @models = ActiveRecord::Base.subclasses - [ActiveRecord::SchemaMigration]
  end

end
