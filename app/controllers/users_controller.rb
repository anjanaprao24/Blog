class UsersController < ApplicationController
  layout 'standard'
  before_filter :authorize, :only=> [:_list]
  def new
  end
 
  def register
   
  end

  def create
   user = User.create(:name=>params[:name] , :password=>params[:password] , :password_confirmation=>params[:password_confirmation] , :email=>params[:email])
  if user.valid?
   user.save
   flash[:notice] = "Successfully Registered !!"
   redirect_to :controller=>'blog' , :action=>'_list'
   else
   flash[:error] = user.errors.full_messages.join("<br>").html_safe
   redirect_to :action =>'register'
   end
  end

  def login
  end

  def check_login
  uname=params[:name]
  password=params[:password]
  @val=true
  @user= User.find :all , :conditions =>{:name=>uname , :role =>@val }
  if !@user.empty?
  session[:name] = uname
  redirect_to :controller=>'blog' , :action=>'dashboard'
  else
  user = User.find_by_name(params[:name])
  if user && user.authenticate(params[:password])
 #  @person = User.find :all , :conditions => {:name=> uname , :password=>password}
 #  if !@person.empty?

  session[:name] = uname
  redirect_to :controller=>'blog' , :action=>'_list' , :id=>uname
  else 
  flash[:notice] = "Username or Password not valid"
  redirect_to :action=>'login'
  end
  end
 end
  
  def logout
    session[:name] = nil
    flash[:notice] = "You have logged out"
    redirect_to :controller=>'users' , :action=>'login'
  end
 
  def show
  @user= User.all
  end
 
  def assign_role
  @user = params[:roles]
  @user_role = User.find(@user) 
  end
  

  def authorize
   unless User.find_by_name(session[:name])
   flash[:notice] = "Please log in"
   redirect_to(:controller => "blog", :action => "welcome")
  end
  end
   
end
