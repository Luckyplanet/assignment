class SecretCodesController < ApplicationController
  # GET /secret_codes
  def index
    authorize! :read, nil
    @secret_codes = SecretCode.all
  end

  # Custom action to generate bulk secret codes
  def generate
    message = 'Secret codes generated successfully.'
    begin
      ApplicationRecord.transaction do
        generate_params[:limit].to_i.times do
          SecretCode.new.save!
        end
      end
    rescue => exception
      message = exception.message
    end
    redirect_to secret_codes_path, notice: message
  end


  private
    def generate_params
      params.require(:secret_code).permit(:limit)
    end
end
