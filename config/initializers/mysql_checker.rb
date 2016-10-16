version =  ActiveRecord::Base.connection.version.instance_variable_get(:@version).join('.')
raise "***** YOUR MySQL Server does not support JSON fields, current version is #{version}" unless ActiveRecord::Base.connection.supports_json?
