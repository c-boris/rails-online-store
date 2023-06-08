class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:success] = "Created item successfully!"
      redirect_back(fallback_location: items_path)
    else
        @item.errors.full_messages.each do |message|
          flash[:error] = message
        end
      render :new
    end
  end

  
  def index
    @items = Item.all
  end


  def show
    @item = Item.find(params[:id])
  end


  def edit
    if !current_user.is_admin
      flash[:error] = "Permission denied!"
      redirect_back(fallback_location: items_path)
    end
  end


  def update
    if current_user.is_admin
      puts "--------------------"
      puts items_params

      if @item.update(items_params)
        flash[:success] = "Update an item"
        redirect to items_path
      else
        @item.errors.full_messages.each do |message|
          flash[:error] = message
        end
      render :edit
      end
    
    else
      flash[:error] = "Permission denied!"
      redirect_back(fallback_location: items_path)
    end
  end


  def destroy
    if !current_user.is_admin
      flash[:error] = "Permission denied!"
      return redirect_back(fallback_location: root_path)
    end
    @item.destroy
    redirect_to items_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end


    def authorize_admin
      current_user.is_admin
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:title, :description, :price, :image_url, :item_picture)
    end
end