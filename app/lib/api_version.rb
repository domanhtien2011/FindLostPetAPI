class ApiVersion
  attr_reader :version, :default

  def initialize(version, default = false)
    @version = version
    @default = default
  end

  def matchest?(request)
    check_headers(request.headers) || default
  end

  private

    def check_headers(headers)
      # check version from Accept headers; expect custom media type `lost_pets`
      accept = headers[:accept]
      accept && accept.include?("application/vnd.lost_pets.#{version}+json")
    end
end