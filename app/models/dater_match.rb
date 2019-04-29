class DaterMatch < ActiveRecord::Base

  belongs_to :judger,
  :class_name => 'Dater',
  :foreign_key => 'judger_id'

  belongs_to :judgee,
  :class_name => 'Dater',
  :foreign_key => 'judgee_id'



end