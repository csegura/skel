class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :roles

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name,
                  :email,
                  :password,
                  :password_confirmation,
                  :remember_me,
                  :roles,
                  :role_ids

   validates :name, :presence => true,
                    :uniqueness => true,
                    :length => { :maximum => 100 }

  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end

end

