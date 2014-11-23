class SurfBreak < ActiveRecord::Base
  has_many :forecasts

  has_many :user_surf_breaks
  has_many :users, through: :user_surf_breaks

  belongs_to :surf_break_location

  mount_uploader :surfpic, SurfpicUploader

  def surfpic_image
    self.surfpic.blank? ? '/assets/images/default_surf.jpg' : self.surfpic
  end

  
  # in user_surf_breaks#index
  # link_to "Follow this surf break", user_surf_breaks_path(surf_break_id: surf_break.id), method: :post

  #in user_surf_breaks controller#create method
  # surf_break = SurfBreak.find(params[:surf_break_id])
  # surf_break.users << current_user
end
