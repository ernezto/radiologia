class ClinicsController < SecureApplicationController

  def index
    @clinics = Clinic.all
  end

  def create
    clinic = Clinic.new(clinic_params)
    if clinic.save
      redirect_to clinics_path, notice: 'Clínica creada satisfactoriamente'
    else
      redirect_to new_clinic_path, notice: 'Error creando una clínica'
    end
  end

  def new
    @clinic = Clinic.new
  end

  def update
    Clinic.update(clinic_params[:id], clinic_params)
    redirect_to clinics_path, notice: 'Datos actualizados satisfactoriamente'
  end

  private
  def clinic_params
    params.require(:clinic).permit(:id, :name, :address, :phone)
  end
end
