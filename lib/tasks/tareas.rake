namespace :tareas do
  desc "Set las cuentas sin tipo como Normal"
  task set_tipo: :environment do
    BankAccount.find_each do |account|
      unless account.account_type.present?
        account.account_type = "Normal"
        account.save!
        puts "account #{account.id} tiene ya un tipo de cuenta"
      end
    end
  end

  desc "Informar los clientes sin email o telefono"
  task cliente_incompleto: :environment do
    clients = Client.where(email: nil)
    clients.each do |client|
      puts "Por favor contactar a #{client.full_name}(##{client.id}) porque no tiene email."
    end
  end

end
