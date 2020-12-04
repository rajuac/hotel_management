class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new(params[:customer])
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render xml: @room }
    end
  end

  def create
    @customer = Customer.new(customer_params)
    respond_to do |format|
      if @customer.save
        format.html { redirect_to(customers_url, notice: 'Customer was successfully created.') }
        format.xml  { render xml: @customer, status: :created, location: @room }
      else
        format.html { render action: 'new' }
        format.xml  { render xml: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(room_params)
        format.html { redirect_to(customers_url(notice: 'Customer was successfully updated.')) }
        format.xml  { head :ok }
      else
        format.html { render action: 'edit' }
        format.xml  { render xml: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    @customers = Customer.all
    respond_to do |format|
      format.html { redirect_to(customers_url(notice: 'Customer was successfully deleted.')) }

      format.xml  { head :ok }
    end
  end

  def search_customers
    respond_to do |format|
      @customers = if params[:term]
                     Customer.search_by_name(params[:term])
                   else
                     Customer.all
                   end

      format.html { render partial: 'customers/print' }
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :age, :aadhar_no, :phone_no)
  end
end
