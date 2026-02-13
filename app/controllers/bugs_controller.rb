class BugsController < ApplicationController
  def http_code
    @status_code = params[:status].to_i

    unless (400..599).cover?(@status_code)
      return render plain: "Unsupported status code", status: :bad_request
    end

    @status_label = Rack::Utils::HTTP_STATUS_CODES[@status_code] || "Unknown Status"
    render :http_code, status: @status_code
  end
end
