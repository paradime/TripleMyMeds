class Healthid < ActiveRecord::Base
  mount_uploader :photo, ProfileUploader
end
