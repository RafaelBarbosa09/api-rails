namespace :dev do
  desc "ambiente dev"
  task setup: :environment do

    p "cadastrando os tipos..."

    kinds = %w(Amigo Comercial Conhecido)
    kinds.each do | kind |
      Kind.create!(
        description: kind
      )
    end

    p "tipos cadastrados com sucesso!"

    #***************************************

    p "cadastrando os contatos..."

    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end

    p "contatos cadastrados com sucesso!"

  end
end
