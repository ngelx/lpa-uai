class Expedient < ActiveRecord::Base
  attr_accessible :category_id, :details, :presentation, :student_id
  
  has_many :transactions
  belongs_to :student
  belongs_to :category
  
  def generate(params = {:user => nil})
    self.save
    # TODO: Agregar validacion apra que enc aso qeu no se peuda generar la primera transaccion por algun motivo, se borre elexpedietne generado.
    Transaction.generate_first(:expedient => self, :user => params[:user])
  end
  
  def move(params = {:user => nil, :to => nil, :state => nil, :comment => nil})
    # TODO: esto esta feo ...
    Transaction.move(:expedient => self, :user => params[:user], :to => params[:to], :state => params[:state], :comment => params[:comment])
  end
  
end
