class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    @user ||= User.new
    if @user.new_record?
      @user.role_id = 2
    end
    self.send(:"#{@user.role.downcase}_permissions")
  end
  
  def guest_permissions
    forum_permission_load
    can :read, Guild
    can :read, Article
  end
  
  def member_permissions
    guest_permissions
    can :manage, User do |user|
      user == @user
    end
    can :read, Region
  end
  
  def moderator_permissions
    member_permissions
  end
  
  def administrator_permissions
    can :manage, :all
    forum_permission_load
  end

  private
  
  # Forum Permissions
  def forum_permission_load
    can :read, Forum do |forum|
      forum.new_record? || forum.readable.include?(@user.role)
    end
    can :read, Topic do |topic|
      topic.forum.readable.include?(@user.role)
    end
    can :read, Post do |post|
      post.topic.forum.readable.include?(@user.role)
    end
    can :create, Post do |post|
      post.topic.forum.replyable.include?(@user.role) && !(post.topic.closed)
    end
    can :create, Topic do |topic|
      topic.forum.topicable.include?(@user.role)
    end
    can :close, Topic do |topic|
      topic.forum.moderable.include?(@user.role)
    end
    can :open, Topic do |topic|
      topic.forum.moderable.include?(@user.role)
    end
    can :sticky, Topic do |topic|
      topic.forum.moderable.include?(@user.role)
    end
    can :un_sticky, Topic do |topic|
      topic.forum.moderable.include?(@user.role)
    end
    cannot :close, Topic do |topic|
      topic.closed
    end
    cannot :open, Topic do |topic|
      !(topic.closed)
    end
    cannot :sticky, Topic do |topic|
      topic.sticky
    end
    cannot :un_sticky, Topic do |topic|
      !(topic.sticky)
    end
  end

  def moderation

  end
  
  def reply_to_open_topics_only
    can :create, Post do |post|
      !(post.topic.closed)
    end
  end
end
