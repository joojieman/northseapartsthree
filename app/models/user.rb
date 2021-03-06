class User < ApplicationRecord

  include GenericResourceCommon

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable

  belongs_to :system_account
  accepts_nested_attributes_for :system_account

end
