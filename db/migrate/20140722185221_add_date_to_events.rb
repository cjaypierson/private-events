class AddDateToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :time, :datetime
  end
end
