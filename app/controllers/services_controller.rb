class ServicesController < SecureApplicationController

  def index
    @services = Service.all
  end
end
