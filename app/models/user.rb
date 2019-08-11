class User < ApplicationRecord
  validates :email, :nome, presence: true
  has_secure_password
  has_many :sent_indications, :class_name => 'Indication', :foreign_key => 'user_indicator_id'
  has_many :received_indications, :class_name => 'Indication', :foreign_key => 'user_indicated_id'

end
