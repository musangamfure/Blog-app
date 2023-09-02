class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, User
    can :read, Post
    can :read, Comment
    can :manage, Post, author: user
    can :manage, Comment, author: user
    can :manage, Post if user.is? :admin
    can :manage, Comment if user.is? :admin
  end
end
