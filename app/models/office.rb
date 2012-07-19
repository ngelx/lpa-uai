class Office < ActiveRecord::Base
  attr_accessible :name
  
  has_many :transactions
  
  def self.get_first_office
    # TODO: esto es feo ... buscar por el nombre ...
    self.where(:name => "Oficina Receptora").first
  end
end
