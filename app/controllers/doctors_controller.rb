class DoctorsController < SecureApplicationController

  def create
    doctor = Doctor.new(doctor_params.except(:clinics))
    clinics = Clinic.where(id: doctor_params[:clinics])
    doctor.clinics << clinics
    if doctor.save
      return redirect_to doctors_path, notice: 'Doctor creado satisfactoriamente'
    end
    redirect_to new_doctor_path, notice: 'Error creando el doctor'
  end

  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
    @clinics = Clinic.all
  end

  def update
  end

  private
  def doctor_params
    params.require(:doctor)
          .permit(:id, :dni, :name, :lastname, :email, clinics: [])
  end
end
