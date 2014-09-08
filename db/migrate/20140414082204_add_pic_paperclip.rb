class AddPicPaperclip < ActiveRecord::Migration
  def up
     add_column :posts, :pic_file_name,    :string
     add_column :posts, :pic_content_type, :string
     add_column :posts, :pic_file_size,    :integer
     add_column :posts, :pic_updated_at,   :datetime
  end

  def down
  end
end
