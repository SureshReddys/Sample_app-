class SubjectsController < ApplicationController

 before_action :confirm_logged_in

  def index
    @subjects = Subject.sorted
    @subject_count = Subject.count
  end

  def show
     @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
    @subject_count = Subject.count + 1
  end

  def create
    @subject = Subject.new(subject_params)
      if @subject.save
        # redirect_to 'subjects_path'
        flash[:notice] = "subject created successfully"
          redirect_to :action => :index
        else
          @subject_count = Subject.count + 1
          render 'new'
      end
  end

  def edit
      @subject = Subject.find(params[:id])
      @subject_count = Subject.count
  end

  def update
      @subject = Subject.find(params[:id])
       @subject.update_attributes(subject_params)
      if @subject.save
        # redirect_to 'subjects_path'
         flash[:notice] = "subject updated successfully"
          redirect_to :action => :index
        else
          @subject_count = Subject.count
          render 'edit'
      end
  end

  def delete
    subject = Subject.find(params[:id])
      subject.destroy
      flash[:notice] ="subjects '#{subject.name}' deleted successfully"
      redirect_to :action => :index
    
  end

  private

   def subject_params
     params.require(:subject).permit(:name,:position,:visible,:created_at, :updated_at,:number)
   end
end
