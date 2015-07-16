class WelcomeController < ApplicationController
  def index
  end

  def add
    response = { "added": params[:status] }
    sleep 1

    respond_to do |f|
      f.json { render request.format.to_sym => response }
    end
  end
end
