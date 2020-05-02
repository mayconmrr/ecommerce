# frozen_string_literal: true

namespace :dev do
  #####################################################################################################

  desc 'Setup Development'

  task setup: :environment do
    images_path = Rails.root.join('public/system')

    puts 'Executando o setup para desenvolvimento ...'

    puts "Apagando o Banco de Dados... #{`rake db:drop`}"
    puts "Apagando imagens de public/system #{`rm -rf #{images_path}`}"
    puts "Criando o Banco de Dados... #{`rake db:create`}"
    puts "Migrando o Banco de Dados... #{`rake db:migrate`}"
    puts `rake db:seed`
    puts `rake dev:generate_admins`
    puts `rake dev:generate_members`
    puts `rake dev:generate_ads`
    puts `rake dev:generate_comments`

    puts 'Setup executado com sucesso!'
  end

  #####################################################################################################

  desc 'Cria Administradores Fakes'

  task generate_admins: :environment do
    puts 'Cadastrando o Administradores...'

    10.times do
      Admin.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: '123456',
        password_confirmation: '123456',
        role: [0, 1].sample
      )
    end

    puts 'Administradores cadastrados com sucesso!'
  end

  #####################################################################################################

  desc 'Cria Membros Fakes'
  task generate_members: :environment do
    puts 'Cadastrando os Membros...'

    100.times do
      member = Member.new(
        email: Faker::Internet.email,
        password: '123456',
        password_confirmation: '123456'
      )
      member.build_profile_member
      member.profile_member.first_name = Faker::Name.first_name
      member.profile_member.second_name = Faker::Name.last_name

      member.save!
    end
    puts 'Membros cadastrados com sucesso!'
  end

  #####################################################################################################

  desc 'Cria Anúncios Fake'
  task generate_ads: :environment do
    puts 'Cadastrando Anúncios...'

    5.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2, 3, 4, 5].sample),
        description_md: markdown_fake,
        description_short: Faker::Lorem.sentence([2, 3].sample),
        member: Member.first,
        category: Category.all.sample,
        price: "#{Random.rand(500)}, #{Random.rand(99)}",
        finish_date: Time.zone.today + Random.rand(90),
        picture: File.new(Rails.root.join('public', 'templates', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')
      )
    end

    100.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2, 3, 4, 5].sample),
        description_md: markdown_fake,
        description_short: Faker::Lorem.sentence([2, 3].sample),
        member: Member.all.sample,
        category: Category.all.sample,
        price: "#{Random.rand(500)}, #{Random.rand(99)}",
        finish_date: Time.zone.today + Random.rand(90),
        picture: File.new(Rails.root.join('public', 'templates', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')
      )
    end

    puts 'Anúncios cadastrados com sucesso!'
  end

  def markdown_fake
    `ruby -e "require 'doctor_ipsum'; puts DoctorIpsum::Markdown.entry"`
  end

  #####################################################################################################

  desc 'Cria Comentários Fakes'
  task generate_comments: :environment do
    puts 'Cadastrando os comentários...'

    Ad.all.each do |ad|
      Random.rand(3).times do
        Comment.create!(
          body: Faker::Lorem.paragraph([1, 2, 3].sample),
          member: Member.all.sample,
          ad: ad
        )
      end
    end

    puts 'Comentários cadastrados com sucesso!'
  end
end

#####################################################################################################
