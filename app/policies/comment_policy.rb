class CommentPolicy < ApplicationPolicy

  def update?
    user && (user.is_admin? or record.user_id == user.id)
  end

  def destroy?
    update?
  end
end