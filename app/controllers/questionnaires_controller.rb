class QuestionnairesController < ApplicationController
  # need to add authentication
  
  
  before_action :authenticate_user!, :except => [:new, :create]
  
  before_action :set_questionnaire, only: [:show, :edit, :update, :destroy]
  
  #after_action :  , only: [:show]
 
  # GET /questionnaires
  # GET /questionnaires.json
  def index
    @questionnaires = Questionnaire.all
  end

  # GET /questionnaires/1
  # GET /questionnaires/1.json
  def show
    @questionnaire.update_attribute(:answers_read, true)
  end

  # GET /questionnaires/new
  def new
    @questionnaire = Questionnaire.new
  end

  # GET /questionnaires/1/edit
  def edit
  end



  # POST /questionnaires
  # POST /questionnaires.json
  def create
    @questionnaire = Questionnaire.new(questionnaire_params)
    

    respond_to do |format|

      if Questionnaire.exists?(:token => @questionnaire.token)
          format.html {
            redirect_to root_path
            flash[:notice_error] = 'This questionnaire has already been answered.' 
            }
          format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
          
      elsif @questionnaire.save
        #format.html { redirect_to @questionnaire, notice: 'Questionnaire was successfully created.' }
        #format.json { render :show, status: :created, location: @questionnaire }
        
        format.html {
          redirect_to root_path
          flash[:notice_success] = 'Your responses have been submitted.  Thank you.' 
          }
        format.json { render :show, status: :created, location: root_path }
        
      else
        format.html { render :new }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questionnaires/1
  # PATCH/PUT /questionnaires/1.json
  def update
    respond_to do |format|
      if @questionnaire.update(questionnaire_params)
        format.html { redirect_to @questionnaire, notice: 'Questionnaire was successfully updated.' }
        format.json { render :show, status: :ok, location: @questionnaire }
      else
        format.html { render :edit }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionnaires/1
  # DELETE /questionnaires/1.json
  def destroy
    @questionnaire.destroy
    respond_to do |format|
      format.html { redirect_to questionnaires_url, notice: 'Questionnaire was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionnaire
      @questionnaire = Questionnaire.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def questionnaire_params
      params.require(:questionnaire).permit(:questions_concerns, :safe_relaxed, :pain_management, :ponv, :same_anaesthetic, :confident_ability, :cared_for, :anaesthetic_experience, :comments, :token)
    end
end
