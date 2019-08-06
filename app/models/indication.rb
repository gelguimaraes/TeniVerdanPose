class Indication < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  belongs_to :plataform
end
