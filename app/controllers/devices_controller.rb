class DevicesController < ApplicationController
  respond_to :html, :xml, :json
  load_and_authorize_resource
  before_action :set_device, only: [:show, :edit, :update, :destroy]
  layout 'angular'

  def index
    @devices = Device.all
    respond_with(@devices)
  end

  def show
    respond_with(@device)
  end

  def new
    @device = Device.new
    respond_with(@device)
  end

  def edit
  end

  def create
    @device = Device.new(device_params)
    @device.save
    respond_with(@device)
  end

  def update
    @device.update(device_params)
    respond_with(@device)
  end

  def destroy
    @device.destroy
    respond_with(@device)
  end

  private
    def set_device
      @device = Device.find(params[:id])
    end

    def device_params
      params.require(:device).permit(:team_id, :clinic_id, :udid, :imei, :os, :os_version, :version, :product, :color, :active)
    end
end
