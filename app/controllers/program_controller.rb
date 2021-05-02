class ProgramController < ApplicationController
  before_action :set_course, except: [:index, :new, :create]
   
  def index #responsible for showing all programs route: '/programs' path: programs_path
      @programs = Program.all
  end
  
  def new #responsibile for rending a new form route: 'program/new' path: new_program_path
      @program = Program.new
  end

  def create #responsible for processing submitted new form route: '/programs'
    @program = Program.new(program_params)
    @program.save
  end

  # if @program.save
  #     redirect_to program_path(@program)
  #   else
  #     render :new
  # end

  def show #responsible for showing single program route: '/program/:id' path: program_path(program_id)
    @program = Program.find_by_id(params[:id])
  end

  def edit
    @program = Program.find_by_id(params[:id])
  end

  def update
    if @program.update(program_params)
      redirect_to program_path(@program)
    else
      render :edit
    end
  end


  def delete
    Program.find_by_id(params[:id])
    @program.destroy
    redirect_to programs_path #(current_instructor)
  end

 
  
  
end
