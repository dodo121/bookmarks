class WebsitesController < ApplicationController
  expose(:websites)
  expose(:website, attributes: :website_params)

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
    if website.destroy
      redirect_to websites_url, notice: 'Website was successfully destroyed.'
    else
      redirect_to websites_url, notice: "You can't delete this website."
    end
  end

  private

  def website_params
    params.require(:website).permit(:domain)
  end
end
