class WebsitesController < ApplicationController
  expose(:websites)
  expose(:website)
  
  def create
    if website.save
      redirect_to website, notice: 'Website was successfully created.'
    else
      render :new
    end
  end

  def update
    if website.save
      redirect_to website, notice: 'Website was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    website.destroy
    redirect_to websites_url, notice: 'Website was successfully destroyed.'
  end

  private
  
  def website_params
    params.require(:website).permit()
  end
end
