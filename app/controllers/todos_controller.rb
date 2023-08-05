class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]
  
    def index
      @todos = current_user.todos.all
    end
  
    def show
       @todo = Todo.find(params[:id])
    end
  
    def new
      @todo = current_user.todos.build
    end
  
    def create
      @todo = current_user.todos.build(todo_params)
      if @todo.save
        redirect_to todo_path(@todo)
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @todo.update(todo_params)
        redirect_to todo_path(@todo)
      else
        render :edit
      end
    end
  
    def destroy
      @todo.destroy
      redirect_to todos_path
    end
  
    private
  
    def set_todo
      @todo = current_user.todos.find(params[:id])
    end
  
    def todo_params
      params.require(:todo).permit(:title, :description, :completed)
    end
  
    protected
    
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
    end
  
  end