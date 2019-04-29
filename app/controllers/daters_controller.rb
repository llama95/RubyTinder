class DatersController < ApplicationController
  before_action :set_dater, only: [:show, :edit, :update, :destroy]

  # GET /daters
  # GET /daters.json
  def index
    @daters = Dater.all
  end

  def login
  end

  def loginpost
    @dater = Dater.find_by_username(params[:user][:username])
    @attempted_password = params[:user][:password]
    if @dater == nil || @attempted_password != @dater.password
      flash[:message] = "Username and/or password does not exist"
      redirect_to login_path and return
    end
    redirect_to dater_loginas_path :dater_id => @dater.id and return
  end

  # GET /daters/1
  # GET /daters/1.json
  def show
    if session[:logined_dater] == nil
      @showPhone = false
    else
      if session[:logined_dater] == params[:id]
        @showPhone = true
      else
        a = DaterMatch.where(judger_id: session[:logined_dater], judgee_id: params[:id]).first
        b = DaterMatch.where(judger_id: params[:id], judgee_id: session[:logined_dater]).first
        (a && b) ? @showPhone = a.doeslike && b.doeslike : @showPhone = false
      end
    end
  end

  # GET /daters/new
  def new
    @dater = Dater.new
    #@interests = Interest.new
  end

  # GET /daters/1/edit
  def edit
  end

  # POST /daters
  # POST /daters.json
  def create
    @interests = params[:dater][:interests].split(',')
    @dater = Dater.new(dater_params)
    interests_arr = []
    @interests.each do |x|
      findme = Interest.find_by_interest_name(x)
      if findme == nil
        @value = Interest.create(:interest_name => x )
        interests_arr << @value
      else
        interests_arr << findme
        end
    end
    
    if @dater.age < 18
      flash[:message] = "*NOTICE: User requirements not met"
      redirect_to action: "new"
    else
      respond_to do |format|
        if @dater.save
          @dater.interests << interests_arr
          redirect_to dater_loginas_path @dater.id and return
          format.html { redirect_to @dater, notice: 'Dater was successfully created.' }
          format.json { render :show, status: :created, location: @dater }
        else
          format.html { render :new }
          format.json { render json: @dater.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /daters/1
  # PATCH/PUT /daters/1.json
  def update
    respond_to do |format|
      if @dater.update(dater_params)
        format.html { redirect_to @dater, notice: 'Dater was successfully updated.' }
        format.json { render :show, status: :ok, location: @dater }
      else
        format.html { render :edit }
        format.json { render json: @dater.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daters/1
  # DELETE /daters/1.json
  def destroy
    @dater.destroy
    respond_to do |format|
      format.html { redirect_to daters_url, notice: 'Dater was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def loginas
    session[:logined_dater] = params[:dater_id]
    redirect_to swiping_path
  end

  def swiping
    @judger = Dater.find(session[:logined_dater])
    @judgees = @judger.judgees.pluck(:id)
    @potentials = Dater.where.not(id: @judgees + [session[:logined_dater]])
    @dater = @potentials[0]
    flash[:judger] = @judger.id
    if @dater != nil
      flash[:potential] = @dater.id
    else
      flash[:potential] = nil
    end
  end

  def  setup_match
    match = DaterMatch.new
    match.judger = Dater.find flash[:judger]
    match.judgee = Dater.find flash[:potential]
    match.doeslike = params[:commit] == "✓"
    match.save!
    redirect_to swiping_path
  end

  def matches_inbox
    redirect_to login_path if session[:logined_dater] == nil
    @true_judgees = DaterMatch.where(judger_id: session[:logined_dater], doeslike: true).pluck(:judgee_id)
    match_list = []
    @true_judgees.each do |elem|
      anotherList = DaterMatch.where(judger_id: elem, doeslike: true).pluck(:judgee_id)
      match_list.append elem if anotherList.include? session[:logined_dater].to_i
    end
    @matches = Dater.where(id: match_list)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_dater
    @dater = Dater.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def dater_params
    params.require(:dater).permit(:name, :username, :password, :phone_number, :gender, :age, :personal_interests, :profpic)
  end
end
