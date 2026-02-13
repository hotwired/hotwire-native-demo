class Bugs::HttpCodesController < ApplicationController
  def show
    @status_code = params[:status].to_i

    unless (400..599).cover?(@status_code)
      return render plain: "Unsupported status code", status: :bad_request
    end

    @status_label = Rack::Utils::HTTP_STATUS_CODES[@status_code] || "Unknown Status"
    render status: @status_code
  end
end
