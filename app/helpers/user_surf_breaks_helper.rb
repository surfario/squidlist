module UserSurfBreaksHelper
  def get_user_surf_break_for(surf_break_id)
    Rails.logger.info(">>>>>> #{surf_break_id.inspect}")
    user_surf_break = current_user.user_surf_breaks.where(surf_break_id: surf_break_id).first
  end
end
