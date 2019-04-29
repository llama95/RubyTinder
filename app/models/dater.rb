class Dater < ActiveRecord::Base
  has_and_belongs_to_many :interests
  # has_many :news
  # has_many :interests, through: :news

  has_many :dater_matches_judgees,
           :foreign_key => :judger_id,
           :class_name => 'DaterMatch'
  has_many :judgees,
           :through => :dater_matches_judgees,
           :foreign_key => :judgee_id,
           :class_name => 'Dater'

  has_many :dater_matches_judgers,
           :foreign_key => :judgee_id,
           :class_name => 'DaterMatch'
  has_many :judgers,
           :foreign_key => :judger_id,
           :through => :dater_matches_judgers,
           :class_name => 'Dater'

  has_attached_file :profpic, styles: {
      thumb: '100x100>',
      square: '200x200#',
      medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :profpic, :content_type => /\Aimage\/.*\Z/

end
