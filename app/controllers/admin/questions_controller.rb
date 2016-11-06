class Admin::QuestionsController < ApplicationController
  before_action :logged_in_user, :verify_admin
  before_action :find_question, except: [:index, :new, :create]
  before_action :load_subjects, only: :new

  def index
    @questions = Question.paginate page: params[:page]
  end

  def new
    @subjects = Subject.all
    @question = Question.new
  end

  def create
    @question = Question.new question_params
    if @question.save
      @subject = @question.subject
      flash.now[:success] = t "controllers.admin.question.create"
      redirect_to admin_questions_path @question
    else
      load_subjects
      flash.now[:danger] = t "controllers.admin.question.fail"
      render :new
    end
  end

  def update
    if @question.update_attributes question_params
      flash[:success] = t "controllers.admin.question.success"
      redirect_to admin_questions_path
    else
      render :edit
    end
  end

  def destroy
    if @question.destroy
      flash[:success] = t "controllers.admin.question.delete"
    else
      flash[:danger] = t "controllers.admin.question.not"
    end
    redirect_to admin_questions_path
  end

  private
  def load_subjects
    @subjects = Subject.all
  end

  def find_question
    @question = Question.find_by id: params[:id]
    if @question.nil?
      flash[:danger] = t "controllers.admin.question.danger"
      redirect_to admin_questions_path
    end
  end
 
  def question_params
    params.require(:question).permit :content, :subject_id,
      answers_attributes: [:id, :content, :is_correct, :question_id, :_destroy]
  end
end
