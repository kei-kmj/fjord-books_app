# frozen_string_literal: true

class Users::ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]

  def index
    @reports = current_user.reports.order(:created_at)
  end

  def new
    @report = Report.new
  end

  def show
    @report = Report.find(params[:id])
    @comment = Comment.new
    @comments = @report.comments.order(created_at: 'ASC')
  end

  def create
    params[:report][:user_id] = current_user.id
    @report = Report.new(report_params)
    respond_to do |format|
      if @report.save!
        format.html { redirect_to user_reports_path }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    params[:report][:user_id] = current_user.id
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to user_report_path, notice: t('controllers.common.notice_update', name: Report.model_name.human) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to user_reports_path, notice: t('controllers.common.notice_destroy', name: Report.model_name.human) }
    end
  end

  private

  def set_report
    @report = current_user.reports.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :text, :user_id)
  end
end
