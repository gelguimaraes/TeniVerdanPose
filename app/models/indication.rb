class Indication < ApplicationRecord
  belongs_to :user_indicator, :class_name => "User"
  belongs_to :user_indicated, :class_name => "User"
  belongs_to :movie
  belongs_to :plataform
end
