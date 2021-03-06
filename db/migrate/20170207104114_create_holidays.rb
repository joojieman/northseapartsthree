class CreateHolidays < ActiveRecord::Migration[5.0]
  include CommonColumns
  def change
    create_table :holidays, id: false do |t|
      common_set(t)
      remark_column(t)
      implemented_on(t)
      name_column(t)
      t.string :day_scheme_id, :limit => 128
      t.timestamps
    end
  end
end
