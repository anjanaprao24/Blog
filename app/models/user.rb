class User < ActiveRecord::Base
  has_secure_password
  
 
  attr_accessible :email, :name, :password, :password_confirmation , :role
   
  validates :name , :presence => true , :uniqueness => true 
  validates :password, :presence => true 
  validates_confirmation_of :password, :message => "-Your password confirmation does not match the password entered"
  validates :email , :presence => true
  validates_format_of :email, :with => /^[a-z0-9_\+-]+(\.[a-z0-9_\+-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*\.([a-z]{2,4})$/, :message => "-Invalid email ID"
   
   
    
   
end
