# frozen_string_literal: true

class ReportsController < ApplicationController

  def index
    @reports = Report.order(:created_at)
  end
end
