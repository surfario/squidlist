class UserSurfBreak < ActiveRecord::Base
  belongs_to :user
  belongs_to :surf_break
end
