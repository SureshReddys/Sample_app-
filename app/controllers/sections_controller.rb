class SectionsController < ApplicationController
 
before_action :find_page

  def index
    @sections = @page.sections.sorted
  end

  def show
     @section = Section.find(params[:id])
  end

  def new
  
    @section = Section.new({:page_id => @page.id,:name => "Default"})
     
     #@pages = Page.order('position Asc')

     @pages = @page.subject.pages.sorted

     @section_count = Section.count + 1
  end

  def create
    @section = Section.new(section_params)
      if @section.save
        # redirect_to 'sections_path'
        flash[:notice] = "section created successfully"
          redirect_to(:action => :index,:page_id => @page.id)
        else
          render 'new'
      end
  end

  def edit
      @section = Section.find(params[:id])
     @pages = @page.subject.pages.sorted
      #@pages = Page.order('position Asc')

     @section_count = Section.count 
  end

  def update
      @section = Section.find(params[:id])
       @section.update_attributes(section_params)
      if @section.save
        # redirect_to 'sections_path'
         flash[:notice] = "section updated successfully"
          redirect_to(:action => :index,:page_id => @page.id)
        else
          render 'edit'
      end

  end

  def delete
    section = Section.find(params[:id])
      section.destroy
      flash[:notice] ="sections '#{section.name}' deleted successfully"
      redirect_to :action => :index
    
  end

  private

   def section_params
     params.require(:section).permit(:page_id,:name,:position,:visible,:content_type,:content)
   end

      def find_page
       if params[:page_id]
        @page = Page.find(params[:page_id])
       end
      end
end
