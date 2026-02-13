class HttpCodesController < ApplicationController
  CLIENT_ERROR_CODES = [ 400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 418, 421, 422, 428, 429 ].freeze
  SERVER_ERROR_CODES = [ 500, 501, 502, 503, 504, 505, 520 ].freeze

  def index
    @client_error_codes = build_error_codes(CLIENT_ERROR_CODES, "Client Error")
    @server_error_codes = build_error_codes(SERVER_ERROR_CODES, "Server Error")
  end

  private

  def build_error_codes(codes, fallback_label)
    codes.map do |code|
      { code:, label: Rack::Utils::HTTP_STATUS_CODES[code] || fallback_label }
    end
  end
end
