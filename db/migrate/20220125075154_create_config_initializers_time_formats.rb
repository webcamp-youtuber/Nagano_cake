class CreateConfigInitializersTimeFormats < ActiveRecord::Migration[5.2]
  def change
    create_table :config_initializers_time_formats do |t|

      t.timestamps
    end
  end
end
