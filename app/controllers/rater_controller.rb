# frozen_string_literal: true

class RaterController < ApplicationController
  def create
    if member_signed_in?
      build_obj
      render json: true
    else
      render json: false
    end
  end

  private

  def build_obj
    obj = params[:klass].classify.constantize.find(params[:id])
    obj.rate params[:score].to_f, current_member, params[:dimension]
  end
end
