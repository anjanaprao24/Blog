class Post < ActiveRecord::Base
  attr_accessible :content, :title , :pic
  has_many :comments , dependent: :destroy
  validates :title , :presence => true
  validates :content , :presence => true
  
 has_attached_file :pic, :styles => 
           { :medium => "300x300>", :thumb => "100x100>" }

  do_not_validate_attachment_file_type :pic
  
  


end
