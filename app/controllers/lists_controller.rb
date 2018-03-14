class ListsController < ApplicationController
  
  before_action :set_list, :only => [:show, :edit, :update, :destroy, :is_public]

  def index
    @lists = List.all
  end

  def is_public
    @list.update(is_public:!(@list.is_public))
  end


  def new 
    @list = List.new
  end
    
  def create
    @list = List.new(list_params)
    if @list.save
       redirect_to lists_url
    else
      render :action => :new   
    end  
  end  

  def show
  
  end

  def edit
  
    if Time.now > @list.due_time
      redirect_to lists_url
      

    end 

  end

  def update
  

    @list.update_attributes(list_params) 

    redirect_to list_path(@list)
  end

  def destroy
  
    @list.destroy

    redirect_to lists_url
  end


private

  def list_params
    params.require(:list).permit(:name, :due_time, :note)
  end

  def set_list
    @list = List.find(params[:id])
  end


end  