class Admin::CronRequestsController < ApplicationController
  before_action :set_admin_cron_request, only: [:show, :edit, :update, :destroy]

  # GET /admin/cron_requests
  # GET /admin/cron_requests.json
  def index
    @admin_cron_requests = Admin::CronRequest.all
  end

  # GET /admin/cron_requests/1
  # GET /admin/cron_requests/1.json
  def show
  end

  # GET /admin/cron_requests/new
  def new
    @admin_cron_request = Admin::CronRequest.new
  end

  # GET /admin/cron_requests/1/edit
  def edit
  end

  # POST /admin/cron_requests
  # POST /admin/cron_requests.json
  def create
    @admin_cron_request = Admin::CronRequest.new(admin_cron_request_params)

    respond_to do |format|
      if @admin_cron_request.save
        format.html { redirect_to @admin_cron_request, notice:  I18n.t('admin.cron_requests.create.message.success') }
        format.json { render :show, status: :created, location: @admin_cron_request }
      else
        format.html { render :new }
        format.json { render json: @admin_cron_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/cron_requests/1
  # PATCH/PUT /admin/cron_requests/1.json
  def update
    respond_to do |format|
      if @admin_cron_request.update(admin_cron_request_params)
        format.html { redirect_to @admin_cron_request, notice:  I18n.t('admin.cron_requests.update.message.success')  }
        format.json { render :show, status: :ok, location: @admin_cron_request }
      else
        format.html { render :edit }
        format.json { render json: @admin_cron_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/cron_requests/1
  # DELETE /admin/cron_requests/1.json
  def destroy
    @admin_cron_request.destroy
    respond_to do |format|
      format.html { redirect_to admin_cron_requests_url, notice:   I18n.t('admin.cron_requests.destroy.message.success')  }
      format.json { head :no_content }
    end
  end

  def logs
    @admin_cron_request_logs = Admin::CronRequest.find(params[:cron_request_id]).cron_request_logs.order("id DESC")
  end

  def run_now
    @admin_cron_request = Admin::CronRequest.find(params[:cron_request_id])
    @admin_cron_request.run!
    respond_to do |format|
      format.html { redirect_to admin_cron_requests_url, notice:   I18n.t('admin.cron_requests.run_now.message.success')  }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_cron_request
      @admin_cron_request = Admin::CronRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_cron_request_params
      params.require(:admin_cron_request).permit(:title, :description, :url, :http_method, :periodicity, :at, :status, :user_id, :periodicity_type, :params)
    end
end
