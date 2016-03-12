class Profile < ActiveRecord::Base
  belongs_to 		:user
  
  validates(:first_name, :last_name, :dob, presence: true)

  mount_uploader :profile_pic, ProfilePicUploader

  def fullname
  	[first_name, last_name].join(" ")
  end
end
