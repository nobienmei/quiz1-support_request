class Support < ActiveRecord::Base
  validates :name, :email, :department, :message, presence: true

  self.per_page = 5

def self.search(search)
  if search
    where(['name LIKE ? OR email LIKE ? OR message LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"]).order("status ASC")
  else
    all.order("status ASC")
  end
end
end
