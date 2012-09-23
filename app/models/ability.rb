class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    @user ||= User.new
    if @user.new_record?
      guest_permissions
    else
      self.send(:"#{@user.role.downcase}_permissions")
    end
  end
  
  def guest_permissions
    can :read, Guild
    can :read, Article
  end
  
  def member_permissions
    guest_permissions
    can :manage, User do |user|
      user == @user
    end
    can :read, Region
    can :read, Forum
    can :read, Topic
    can :create, Topic do |topic|
      topic.forum_id != 2
    end
    can :read, Post
    can :create, Post
  end
  
  def administrator_permissions
    can :manage, :all
  end
end
