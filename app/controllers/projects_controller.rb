# frozen_string_literal: true

class ProjectsController < ApplicationController
  def index
    @project = Project.limit(10)
  end

  def show
    @project = Project.find_by(id: params[:id])
    @comments = @project.comments
  end
end
