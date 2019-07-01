class ConsolesController < ApplicationController
    before_action :set_console, only: [:show, :edit, :update, :destroy]

    # GET /products
    # GET /products.json
    def index
        @console = Console.all
    end

    # GET /products/1
    # GET /products/1.json
    def show
    end

    # GET /products/new
    def new
        @console = Console.new
    end

    # GET /products/1/edit
    def edit
    end

    # POST /products
    # POST /products.json
    def create
        @console = Console.new(console_params)

        respond_to do |format|
        if @console.save
            format.html { redirect_to @console, notice: 'Console was successfully created.' }
            format.json { render :show, status: :created, location: @console }
        else
            format.html { render :new }
            format.json { render json: @console.errors, status: :unprocessable_entity }
        end
        end
    end

    # PATCH/PUT /products/1
    # PATCH/PUT /products/1.json
    def update
        respond_to do |format|
        if @console.update(console_params)
            format.html { redirect_to @console, notice: 'Console was successfully updated.' }
            format.json { render :show, status: :ok, location: @console }
        else
            format.html { render :edit }
            format.json { render json: @console.errors, status: :unprocessable_entity }
        end
        end
    end

    # DELETE /products/1
    # DELETE /products/1.json
    def destroy
        @console.destroy
        respond_to do |format|
        format.html { redirect_to products_path, notice: 'Console was successfully destroyed.' }
        format.json { head :no_content }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_console
        @console = Console.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def console_params
        params.require(:console).permit(:name, :price)
        end
    end
