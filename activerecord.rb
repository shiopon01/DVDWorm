require 'active_record'

ActiveRecord::Base.configurations = YAML.load_file('database.yml')
ActiveRecord::Base.establish_connection(:development)

class Dvd < ActiveRecord::Base
    belongs_to :category
    has_many :dvd_actors
    has_many :actors, :through => :dvd_actors
end

class Actor < ActiveRecord::Base
    has_many :dvd_actors
    has_many :dvds, :through => :dvd_actors
end

class DvdActor < ActiveRecord::Base
    belongs_to :dvd
    belongs_to :actor
end

class Category < ActiveRecord::Base
    has_one :dvd
end