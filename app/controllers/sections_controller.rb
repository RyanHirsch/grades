class SectionsController < ApplicationController
  before_action :set_term
  before_action :set_course
  before_action :set_parent
  before_action :set_section, only: [:show, :edit, :update, :destroy]


  # GET /sections
  # GET /sections.json
  def index
    @sections = Section.all
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
    add_breadcrumb @section.name, @section
  end

  # GET /sections/new
  def new
    if @parent
      @section = @parent.sections.new
    else
      @section = Section.new
    end
    add_breadcrumb "New Section", @section
    #set term or course here
    #@parent.section.new
  end

  # GET /sections/1/edit
  def edit
    add_breadcrumb "Edit Section", '' 
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = @parent.sections.build(section_params)

    respond_to do |format|
      if @section.save
        format.html { redirect_to [@parent, @section], notice: 'Section was successfully created.' }
        format.json { render action: 'show', status: :created, location: @section }
      else
        format.html { render action: 'new' }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to [@parent, @section], notice: 'Section was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to @parent }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      if @parent
        @section = @parent.sections.find(params[:id])
      else
        @section = Section.find(params[:id])
      end
    end

    def set_term
      @term = Term.find(params[:term_id]) if params[:term_id]
      add_breadcrumb "Terms", :terms_path if @term
    end

    def set_course
      @course = Course.find(params[:course_id]) if params[:course_id]
      add_breadcrumb "Courses", :courses_path if @course
    end

    def set_parent
      @parent = @term if @term
      @parent = @course if @course
      add_breadcrumb @parent.name, @parent if @parent
      # add_breadcrumb @parent.class.name.to_s.pluralize, @parent.class.name.to_s.pluralize.downcase + "_path" if @parent
    end

    def section_params
      params.require(:section).permit(:name, :term_id, :course_id)
    end
end
