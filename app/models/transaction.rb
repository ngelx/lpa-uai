class Transaction < ActiveRecord::Base
  attr_accessible :comment, :expedient_id, :office_id, :state, :user_id
  
  belongs_to :user
  belongs_to :office
  belongs_to :expedient
  
  
  STATE = {:new => {:id => 1, :name => "Nuevo"} }
  INITIAL_COMMENT = "Ingreso del Expediente"
  
  def self.generate_first(params = {:user => nil,:expedient => nil} )
    office = Office.get_first_office
    
    self.create(:user_id        => params[:user].id, 
                :expedient_id   => params[:expedient].id,
                :office_id      => office.id,
                :state          => STATE[:new][:id],
                :comment        => INITIAL_COMMENT
               )
  end
  
  def self.move(params = {:user => nil,:expedient => nil, :to => nil, :state => nil, :comment => nil} )
    self.create(:user_id        => params[:user].id, 
                :expedient_id   => params[:expedient].id,
                :office_id      => params[:to].id,
                :state          => params[:expedient] || STATE[:default][:id],
                :comment        => params[:comment]
               )

  end
  
  def state_name
    STATE.each_value do |val|
      return val[:name] if (val[:id] == self.state)
    end
    return "Desconocido"
  end
  
end
