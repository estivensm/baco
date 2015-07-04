class RemoveAgeFromClients < ActiveRecord::Migration
  def change
    add_column :clients, :birth_at, :datetime
    Client.all.each do |client|
      client.birth_at = client.age.years.ago
      client.save
    end
    remove_column :clients, :age, :integer

  end
end
