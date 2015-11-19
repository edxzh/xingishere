class Admin::SubscribesController < AdminController
  layout 'admin'

  def index
    @subscribes = Subscribe.order('id DESC').page(params[:page]).per(10)
  end

  def destroy
    @subscribe = Subscribe.find(params[:id])
    @subscribe.destroy

    respond_to do |format|
      format.html { redirect_to admin_subscribes_url }
      format.json { head :no_content }
    end
  end
end
