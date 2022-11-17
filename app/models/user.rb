class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :likes, dependent: :destroy
  has_many :comments

  has_many :requested_friends, foreign_key: 'requestor_id', class_name: 'FriendRequest'
  has_many :request_received, foreign_key: 'receiver_id', class_name: 'FriendRequest'

  has_many :accepted_requests, foreign_key: 'receiver_user_id', class_name: 'Friend'
  has_many :made_requests, foreign_key: 'requestor_user_id', class_name: 'Friend'

  attr_writer :login

  def login
    @login || username || email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(['lower(username) = :value OR lower(email) = :value',
                                    { value: login.downcase }]).first
    elsif conditions.key?(:username) || conditions.key?(:email)
      where(conditions.to_h).first
    end
  end
end
