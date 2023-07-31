class CashrecordsController < ApplicationController
  def index
    @propertyrecord = Propertyrecord.find(params[:propertyrecord_id])
    @cashrecords = Cashrecord.all
  end

  def cashin
    @propertyrecord = Propertyrecord.find(params[:propertyrecord_id])
    @cashrecord = Cashrecord.new
    
  end

  def cashout
    @cashrecord = Cashrecord.new
  end

  def create
    @propertyrecord = Propertyrecord.find(params[:propertyrecord_id])
    @cashrecord = @propertyrecord.cashrecords.create(cash_params)
    redirect_to propertyrecord_path(@propertyrecord)
  end

  def destroy
    @propertyrecord = Propertyrecord.find(params[:propertyrecord_id])
        @cashrecord = @propertyrecord.cashrecords.find(params[:id])
        @cashrecord.destroy
        redirect_to propertyrecord_cashrecord_path(@propertyrecord), status: :see_other
  end

  def create_cashout
    puts "create ok"
    property_record = Propertyrecord.first
    @cashrecord = property_record.cashrecords.new(cashout_params)
    puts "Data Done"
    if @cashrecord.save!
      puts "successfully"
      redirect_to root_path, notice: "cashrecord was successfully created."
    else
      puts "no save"
      @cashrecords = Cashrecord.all
      render :index, status: :unprocessable_entity
    end
  end  

  def destroy_cashout
    puts "delete cashout"
    @cashrecord = Cashrecord.find(params[:id])
    @cashrecord.destroy
    redirect_to root_path, status: :see_other
  end

  private
def cash_params
  params.require(:cashrecord).permit(:category, :amount, :notes, :transaction_type)
end
def cashout_params
  params.require(:cashrecord).permit(:category, :amount, :notes, :transaction_type, :propertyrecord_id)
end
end
