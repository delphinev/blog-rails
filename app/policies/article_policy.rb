class ArticlePolicy < ApplicationPolicy

  def create?
    user
  end

  def update?
    user && (user.is_admin? or record.user_id == user.id) #record fait référence à article
  end

  def destroy?
    update?
  end
end
