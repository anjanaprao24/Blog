class RenameColumn < ActiveRecord::Migration
  def up
  rename_column :users, :salt , :password_digest
  end

  def down
  end
end
