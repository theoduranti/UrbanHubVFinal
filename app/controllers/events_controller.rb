class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

 
 
 
 
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json

  
  # IL FAUT AJOUTER UN TRUC, CAR POUR LE MOMENT PAS POSSIBLE DE CREER UN EVENT DEPUIS SESSION PRO
  # if current_ele = null                (ou trouver comment dire selon la session utilisée)
  #     @event.creator = current_ele
  # else 
  #     @event.creator = current_ele
  # end
  def create
    @event = Event.new(event_params)
    if ele_signed_in?
      @event.creator = current_ele
    elsif pro_signed_in?
      @event.creator = current_pro
    else
    end
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end






  def suscribe
    @event = Event.find(params[:id])
    if 
    @event.attendees.include? current_ele
    flash[:error] = "Vous participez déjà à l'événement !" 
    redirect_to @event
    else
    @event.attendees << current_ele
    flash[:success] = "Vous participez à l'événement en tant qu'élève!" 
    redirect_to @event
    end
    if 
      @event.attendees.include? current_pro
      flash[:error] = "Vous participez déjà à l'événement !" 
      redirect_to @event
    else
      @event.attendees << current_pro
      flash[:success] = "Vous participez à l'événement en tant que professeur!" 
      redirect_to @event
    end
  end

  def adduser  
    @user = User.find(params[:id])
    @event = Event.find(params[:test])
 #   if 
 #   @event.attendees.include? @user
 #   flash[:danger] = "#{@user.name} participe déjà à l'événement !" 
 #   redirect_to @event
 #   else
    @event.attendees << @user
    flash[:success] = "#{@user.name} est ajouté à l'événement ! !" 
    redirect_to @event
 #   end
  end






  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.fetch(:event, {})
    end
end
