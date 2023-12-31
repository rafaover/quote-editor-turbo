class QuotesController < ApplicationController
  before_action :set_quote, only: %i[show edit update destroy]

  def index
    @quotes = current_company.quotes.order(created_at: :desc)
  end

  def show; end

  def new
    @quote = Quote.new
  end

  def edit; end

  def create
    @quote = current_company.quotes.new(quote_params)

    if @quote.save
      respond_to do |format|
        format.html { redirect_to quotes_path, notice: "Quote was successfully created." }
        # because Turbo Stream responses don't redirect to other locations, so
        # the flash has to appear on the page right now.
        format.turbo_stream { flash.now[:notice] = "Quote was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @quote.update(quote_params)
      respond_to do |format|
        format.html { redirect_to quotes_path, notice: "Quote was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Quote was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to quotes_path, notice: "Quote was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Quote was successfully deleted." }
    end
  end

  private

  def set_quote
    @quote = current_company.quotes.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:name)
  end
end
