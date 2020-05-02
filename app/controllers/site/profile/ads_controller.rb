# frozen_string_literal: true

module Site
  module Profile
    class AdsController < Site::ProfileController
      before_action :set_ad, only: %w[edit update]

      def index
        @ads = Ad.to_the(current_member)
      end

      def edit; end

      def update
        if @ad.update(params_ad)
          redirect_to site_profile_ads_path, notice: 'Anúncio atualizado com sucesso!'
        else
          render :edit
        end
      end

      def new
        @ad = Ad.new
      end

      def create
        @ad = Ad.new(params_ad)
        @ad.member = current_member
        if @ad.save
          redirect_to site_profile_ads_path, notice: 'Anúncio criado com sucesso'
        else
          render :new
        end
      end

      private

      def set_ad
        @ad = Ad.find(params[:id])
      end

      def params_ad
        params.require(:ad).permit(:id, :title, :category_id, :price, :description,
                                   :description_md, :description_short,
                                   :picture, :finish_date)
      end
    end
  end
end
