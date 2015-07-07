class WelcomeController < ApplicationController
  def index
  end

  def demo
  	response = { "name": "John", "age": 45 }

  	respond_to do |f|
  		f.html {}
  		f.any(:xml, :json) {
			render request.format.to_sym => response  			
  		}
  	end
  end
end
