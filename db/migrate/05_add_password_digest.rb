class AddPasswordDigest < ActiveRecord::Migration
  def change
    add_column :username, :password_digest, :string
  end
end
