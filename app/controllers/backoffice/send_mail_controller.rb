# frozen_string_literal: true

module Backoffice
  class SendMailController < ApplicationController
    def edit
      @admin = Admin.find(params[:id])
      respond_to do |format|
        format.js
      end
    end

    def create
      begin
        send_admin_message
      rescue StandardError
        @notify_message = 'Erro ao enviar email. Tente novamente'
        @notify_flag = 'error'
      end
      respond_to do |format|
        format.js
      end
    end

    def send_admin_message
      AdminMailer.send_message(current_admin,
                               params[:'recipient-text'],
                               params[:subject_text],
                               params[:'message-text']).deliver_now

      @notify_message = 'Email enviado com sucesso!'
      @notify_flag = 'success'
    end
  end
end
