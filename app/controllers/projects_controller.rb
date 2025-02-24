# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show change_status]

  def index
    @project = Project.limit(15)
  end

  def show
    @comments = @project.comments
  end

  def change_status
    if @project.update(status: params[:project][:status])
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to projects_path, notice: "Status updated successfully!" }
      end
    else
      render turbo_stream: turbo_stream.replace(@project, partial: "projects/project", locals: { project: @project })
    end
  end

  private

  def set_project
    @project = Project.find_by(id: params[:id])
  end
end
