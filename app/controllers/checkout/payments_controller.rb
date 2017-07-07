class Checkout::PaymentsController < ApplicationController
	def create
		# Email: c28740292197419432415@sandbox.pagseguro.com.br
		# Senha: jhC3d0Vj03xeEYjM
		# Cartão de Crédito: 4111111111111111 / Bandeira: VISA / Valido Até: 12/2030 / CVV: 123

		ad = Ad.find(params[:ad_id])
		ad.processing!

		order = Order.create( ad: ad, buyer_id: current_member.id )
		order.waiting!

		payment = PagSeguro::PaymentRequest.new

		payment.reference = order.id
		payment.notification_url = checkout_notifications_url # Fix Later
		payment.redirect_url = site_ad_detail_url(ad)

		payment.items << {
			id: ad.id,
			description: ad.title,
			amount: ad.price.to_s.gsub(',' , '.') #12.32
		}

		response = payment.register

		if response.errors.any?
			redirect_to site_ad_detail_path(ad), alert: "Erro ao processor compra... Entre em contato com o SAC."
		else
			redirect_to response.url
		end

		#render text: "Processando... Pedido: #{order.status_i18n} - Anúncio: #{ad.status_i18n}"
	end
end
