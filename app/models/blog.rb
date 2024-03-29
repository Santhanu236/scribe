# frozen_string_literal: true

require 'carrierwave/orm/activerecord'
class Blog < ApplicationRecord
  mount_uploader :img_url, ImageUploaderUploader
end
