class RostersController < ApplicationController
  def show
    @roster = Roster.find(params[:id])
    @assignments = @roster.assignments.order(:year, :month_number, :week_number)
  end
end
