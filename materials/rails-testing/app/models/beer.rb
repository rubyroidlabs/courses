class Beer < ActiveRecord::Base
  belongs_to :category

  def i_love_it
    self.name == 'Alivaria' ? 'Tak' : 'Ne'
  end
end
