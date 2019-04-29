class Interest < ActiveRecord::Base
  # has_many :news
  # has_many :daters, through: :news
  has_and_belongs_to_many :daters

end
