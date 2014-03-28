class AddStatusToSupporters < ActiveRecord::Migration
  def change
  	add_column :supporters, :status, :string, :default => "Not Done"
  end
end
