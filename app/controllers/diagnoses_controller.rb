class DiagnosesController < ApplicationController
  def index
  end

  def new
        @diagnosis = Diagnosis.new
  end

  def show
        @diagnosis = Diagnosis.find_by(id: params[:id])
  end

  def create
        diagnosis = Diagnosis.new(diagnosis_params)
        if diagnosis.save
            flash[:notice] = "診断が完了しました"
            redirect_to diagnosis_path(diagnosis.id)
        else
            redirect_to :action => "new"
        end
  end
  
 private
  def diagnosis_params
        params.require(:diagnosis).permit(:question1, :question2, :question3, :question4, :question5)
  end
end
