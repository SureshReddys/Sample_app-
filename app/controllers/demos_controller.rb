class DemosController < ApplicationController

 layout "admin"

  def index
  	#render('hello')
  end

  def hello
  	#render('index')
  	@array = [1,2,3,4,5]
    @id = params['id']
    @page = params[:page]
  end

  def other_hello
  	 redirect_to(:action=>'index')

  end

  def text_helpers

  end

  def escape_output

  end

end
