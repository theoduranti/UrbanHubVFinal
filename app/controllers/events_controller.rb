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
    @event = Event.find(params[:id])
    @allele = Ele.all
    @allpro = Pro.all
    if @event.naturecreateur == "eleve"
      @creator = Ele.find(@event.creator_id)
    elsif @event.naturecreateur == "professeur"
      @creator = Pro.find(@event.creator_id)
    else
    end
    if @event.professeur != "vide"
      @professeur_de_l_event = Pro.find_by_email(@event.professeur)
    else
      @professeur_de_l_envent = "ajouter"
    end
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


  def create
    @event = Event.new(event_params)
    @event.professeur = "vide"
    if ele_signed_in?
      @event.creator_id = current_ele.id
      @event.naturecreateur = "eleve"
    elsif pro_signed_in?
      @event.creator_id = current_pro.id
      @event.naturecreateur = "professeur"
      @event.professeur = current_pro.email
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






  def subscribe
    @event = Event.find(params[:id])
    if 
      ele_signed_in?
      @event.eleattendees << current_ele
      flash[:success] = "Vous participez à l'événement en tant qu'élève!" 
      redirect_to "/"
    elsif
      pro_signed_in? 
      @event.proattendees << current_pro
      @event.professeur = current_pro.email
      flash[:success] = "Vous participez à l'événement en tant qu'élève!" 
      redirect_to "/"
    end

  end

  def addeletoinvitation  
    @ele = Ele.find(params[:id])
    @event = Event.find(params[:test])
 #   if 
 #   @event.attendees.include? @user
 #   flash[:danger] = "#{@user.name} participe déjà à l'événement !" 
 #   redirect_to @event
 #   else
    @event.eleinvitatees << @ele
    flash[:success] = "#{@ele.firstname} est ajouté à l'événement ! !" 
    redirect_to @event
 #   end
  end


  def addprotoinvitation  
    @pro = Pro.find(params[:id])
    @event = Event.find(params[:test])
 #   if 
 #   @event.attendees.include? @user
 #   flash[:danger] = "#{@user.name} participe déjà à l'événement !" 
 #   redirect_to @event
 #   else
    @event.proinvitatees << @pro
    flash[:success] = "#{@pro.firstname} est ajouté à l'événement ! !" 
    redirect_to @event
 #   end
  end






  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from  the scary internet, only allow the white list through.
    def event_params
      params.fetch(:event, {})
      params.require(:event).permit(:name, :discipline, :description, :date, :ville, :prix)
    end
end
