class Api::V1::FactsController < ApplicationController
  before_action :find_fact, only: [:show, :update, :destroy]

  def index
    @facts = Fact.all
    render jason: @facts
  end

  def show
    render jason: @fact
  end

  def create
    @fact = Fact.new(fact_params)
    if @fact.save
      rander jason: @fact
    else
      render error: {error: 'Unable to create fact'}, status: 400
    end
  end

  def update
    if @fact
      @fact.update(fact_params)
      render jason: { message: 'Fact has been updated successfully'}, status: 200
    else
      render jason: { error: 'Unable to update Fact.'}, status: 400
    end
  end

  def destroy
    if @fact
      @fact.destroy
      render jason: { message: 'Fact has been  successfully deleted'}, status: 200
    else
      render jason: { error: 'Unable to delete Fact.'}, status: 400
    end
  end

  private

  def fact_params
    params.require(:fact).permit(:fact, :likes, :user_id)
  end

  def find_fact
    @fact = Fact.find(params[:id])
  end

end
