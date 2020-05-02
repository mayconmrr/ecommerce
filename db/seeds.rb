# frozen_string_literal: true

#############################################################
# Cadastro de categorias
Rails.logger.info('Cadastrando as Categorias...')
categories = ['Animais e acessórios',
              'Esportes',
              'Para a sua casa',
              'Eletrônicos e celulares',
              'Músicas e hobbies',
              'Bebês e crianças',
              'Moda e beleza',
              'Veículos e barcos',
              'Imóveis',
              'Empregos e negócios']

categories.each do |category|
  Category.friendly.find_or_create_by!(description: category)
end
Rails.logger.info('Categorias cadastradas com sucesso!')

#############################################################
# Cadastro do Administrado Padrao.
Rails.logger.info('Cadastrando Administrador Padrão...')
Admin.create!(
  name: 'Administrador Geral',
  email: 'admin@admin.com',
  password: '123456',
  password_confirmation: '123456',
  role: 0
)
Rails.logger.info('Administrador cadastrado com sucesso!')

#############################################################
# Cadastra do Administrado Padrao.
Rails.logger.info('Cadastrando Membro Padrão...')
member = Member.new(
  email: 'membro@membro.com',
  password: '123456',
  password_confirmation: '123456'
)
member.build_profile_member
member.profile_member.first_name = Faker::Name.first_name
member.profile_member.second_name = Faker::Name.last_name
member.save!
Rails.logger.info('Membro Padrão cadastrado com sucesso!')
