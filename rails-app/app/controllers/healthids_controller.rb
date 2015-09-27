require 'rjb'

class HealthidsController < ApplicationController

  def index
    @health_ids = Healthid.all
  end

  def show
    @health_id = Healthid.find_by(params[:health_id])
    @photo = photo_names[@health_id.fname]
  end

  def create
    entry = Healthids.new(params)
  end

  def health_id_params
    params.permit(fname, lname, health_id)
  end

  def photo_names
    { "Kaleb"=>"kaleb.jpeg",
      "Chantal"=>"chantal.jpeg",
      "Cal"=>"cal.jpeg",
      "Niki"=>"nikki.jpeg" }
  end
end
