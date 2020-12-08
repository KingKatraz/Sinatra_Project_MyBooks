class User < ActiveRecord::Base
    has_secure_password
    has_many :books
    validates_presence_of :username, :password
    validates :username, uniqueness: true

end 