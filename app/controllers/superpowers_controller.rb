class SuperpowersController < ApplicationController
    before_action :set_superpower, only: [:show, :edit, :update, :destroy]
  
    # GET /superpowers
    # GET /superpowers.json
    def index
      @superpowers = Superpower.all
    end
  
    # GET /superpowers/1
    # GET /superpowers/1.json
    def show
    end
  
    # GET /superpowers/new
    def new
      @superpower = Superpower.new
    end
  
    # GET /superpowers/1/edit
    def edit
    end
  
    # POST /superpowers
    # POST /superpowers.json
    def create
      @superpower = Superpower.new(superpower_params)
  
      respond_to do |format|
        if @superpower.save
          format.html { redirect_to @superpower, notice: 'Superpower was successfully created.' }
          format.json { render :show, status: :created, location: @superpower }
        else
          format.html { render :new }
          format.json { render json: @superpower.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /superpowers/1
    # PATCH/PUT /superpowers/1.json
    def update
      respond_to do |format|
        if @superpower.update(superpower_params)
          format.html { redirect_to @superpower, notice: 'Superpower was successfully updated.' }
          format.json { render :show, status: :ok, location: @superpower }
        else
          format.html { render :edit }
          format.json { render json: @superpower.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /superpowers/1
    # DELETE /superpowers/1.json
    def destroy
      @superpower.destroy
      respond_to do |format|
        format.html { redirect_to superpowers_url, notice: 'Superpower was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_superpower
        @superpower = Superpower.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def superpower_params
        params.require(:superpower).permit(:name)
      end
  end