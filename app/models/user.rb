require 'carrierwave/orm/activerecord'
class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: {case_sensitive: false}
    mount_uploader :img_url, ImageUploaderUploader
end
