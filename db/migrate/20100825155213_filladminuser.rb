class Filladminuser < ActiveRecord::Migration
  def self.up
    User.create! :name => 'administrador',
                 :password => 'admin123',
                 :password_confirmation => 'admin123',
                 :email => 'admin@changeme.com'
  end

  def self.down
    @user = User.find(:name => 'administrador')
    @user.destroy
  end
end

