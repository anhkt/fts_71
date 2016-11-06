class Admin::SubjectsController < ApplicationController
  before_action :logged_in_user
  before_action :verify_admin
  before_action :find_subject, except: [:index, :new, :create]

  def index
    @subjects = Subject.paginate page: params[:page]
  end

  def new
    @subject = Subject.new
  end
  
  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash.now[:success] = t "controllers.admin.subject.success"
      redirect_to admin_subjects_path @subject
    else
      flash.now[:danger] = t "controllers.admin.subject.fail"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @subject.update_attributes subject_params
      flash[:success] = t "controllers.admin.subject.update"
      redirect_to admin_subjects_path
    else
      render :edit
    end
  end

  def destroy
    if @subject.destroy 
      flash[:success] = t "controllers.admin.subject.flash.delete.success"
    else
      flash[:danger] = t "controllers.admin.subject.flash.delete.fail"
    end
    redirect_to admin_subjects_path
  end

  private
  def find_subject
    @subject = Subject.find_by id: params[:id]
    if @subject.nil?
      flash[:danger] = t "controllers.admin.subject.danger"
      redirect_to admin_subjects_path
    end
  end

  def subject_params
    params.require(:subject).permit :name, :duration, :number_question,
      questions_attributes: [:id, :content, :subject_id]
  end
end
