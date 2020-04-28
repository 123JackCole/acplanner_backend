class Api::V1::SettingsController < ApplicationController
    skip_before_action :authorized

    def index
        @settings = Setting.all
        render json: @settings
    end

    def show
        @setting = Setting.find_by(name: params[:id])
        render json: @setting
    end

    def create
        @setting = Setting.new(setting_params)
        if @setting.valid?
            @setting.save
            render json: { setting: SettingSerializer.new(@setting) }
        else 
            render json: { message: setting.errors.full_messages} 
        end
    end

    private

    def setting_params
        params.require(:setting).permit(:name)
    end
end
