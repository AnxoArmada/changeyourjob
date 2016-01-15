class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  respond_to :html

  def index
    @tests = Test.all
    respond_with(@tests)
  end

  def show
    respond_with(@test)
  end

  def new
    @test = current_user.tests.build
    respond_with(@test)
  end

  def edit
  end

  def create
    @test = current_user.tests.build(test_params)
    flash[:notice] = 'Pin was successfully created.' if @test.save
    respond_with(@test)
  end

  def update
    @test.update(test_params)
    respond_with(@test)
  end

  def destroy
    @test.destroy
    respond_with(@test)
  end

  private
    def set_test
      @test = Test.find(params[:id])
    end

    def correct_user
      @test = current_user.tests.find_by(id: params[:id])
      redirect_to tests_path, notice: "No authorized to edit this pin." if @test.nil?
    end

    def test_params
      params.require(:test).permit(:description)
    end
end
