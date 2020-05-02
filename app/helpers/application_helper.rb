# frozen_string_literal: true

module ApplicationHelper
  def current_user
    current_member
  end

  def devise_sign_in?
    params[:controller] == 'members/sessions' ? '' : 'display:none;'
  end

  def devise_sign_up?
    params[:controller] == 'members/registrations' ? '' : 'display:none;'
  end

  def review_label(ad)
    number_of_reviews = ad.rates('quality').count
    'review'.pluralize(number_of_reviews)
  end
end
