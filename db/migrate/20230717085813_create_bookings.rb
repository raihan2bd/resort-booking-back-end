class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :address
      t.references :user, null: false, foreign_key: true, on_delete: :cascade
      t.references :resort, null: false, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
