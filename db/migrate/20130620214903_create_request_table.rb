class CreateRequestTable < ActiveRecord::Migration
  def change
    create_table(:requests) do |t|
      t.integer :requester_id, :null => false
      t.integer :shoveler_id
      t.string :job_size, :null => false
      t.integer :offer, :null => false, :default => 0

      t.timestamps
    end
  end
end
