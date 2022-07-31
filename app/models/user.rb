require 'carrierwave/orm/activerecord'
class User < ApplicationRecord
    has_secure_password
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :password, presence: true
    validates :email, presence: true, uniqueness: {case_sensitive: false}
    mount_uploader :img_url, ImageUploaderUploader
end
