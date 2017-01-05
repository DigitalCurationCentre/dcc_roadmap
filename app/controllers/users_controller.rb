class UsersController < ApplicationController
  after_action :verify_authorized

  def admin_index
    authorize User
    @users = current_user.org.users.includes(:project_groups)
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def admin_grant_permissions
    @user = User.includes(:perms).find(params[:id])
    authorize @user
    user_permss = current_user.perms
    @perms = user_perms & Perm.where(name: [constant("user_role_types.change_org_details"),constant("user_role_types.use_api"), constant("user_role_types.modify_guidance"), constant("user_role_types.modify_templates"), constant("user_role_types.grant_permissions")])
  end

  def admin_update_permissions
    @user = User.includes(:perms).find(params[:id])
    authorize @user
    perms_ids = params[:perm_ids].blank? ? [] : params[:perm_ids].map(&:to_i)
    perms = Perm.where( id: perms_ids)
    current_user.perms.each do |perm|
      if @user.perms.include? perm
        if ! perms.include? perm
          @user.perms.delete(perm)
          if perm.name == constant("user_role_types.use_api")
            @user.remove_token!
          end
        end
      else
        if perms.include? perm
          @user.perms << perm
          if perm.name == constant("user_role_types.use_api")
            @user.keep_or_generate_token!
          end
        end
      end
    end
    @user.save!
    respond_to do |format|
      format.html { redirect_to({controller: 'users', action: 'admin_index'}, {notice: I18n.t('helpers.success')})}
    end
  end

end
