class CreateRobotReports < ActiveRecord::Migration[7.1]
  def change
    create_table :robot_reports do |t|
      t.timestamps
    end
  end
end
