# frozen_string_literal: true

class ConversationHistoriesController < ApplicationController
  before_action :set_project, only: %i[index]

  def index
    @project_status_audits = Audited::Audit.where(auditable: @project).order(:created_at)
    @comment_audits = Audited::Audit.where(auditable: @project.comments).order(:created_at)

    if @project_status_audits.nil? && @comment_audits.nil?
      flash[:alert] = "No history found"
      redirect_to projects_path and return
    end
    @history = (@project_status_audits + @comment_audits).sort_by(&:created_at)
  end


  private

  def set_project
    @project = Project.find_by(id: params[:project_id] || params[:id])
  end
end
