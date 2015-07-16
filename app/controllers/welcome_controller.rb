class WelcomeController < ApplicationController
  def index
  end

  def add
    status = params[:status] == 'false' ? true : false;
    response = { "added": status }
    sleep 1

    respond_to do |f|
      f.json { render request.format.to_sym => response }
    end
  end
end
