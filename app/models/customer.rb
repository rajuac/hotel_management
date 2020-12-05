class Customer < User
  include PgSearch::Model
  pg_search_scope :search_by_name, against: [:name]
  validates_presence_of :name
  validates :email, uniqueness: true
  validates :aadhar_no, uniqueness: true
  validates_presence_of :phone_no
end
