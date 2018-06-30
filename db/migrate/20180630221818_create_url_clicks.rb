class CreateUrlClicks < ActiveRecord::Migration[5.2]
  def change
    create_table :url_clicks do |t|
      t.references :url, null: false
      t.json :request_headers, default: {}
      t.timestamps null: false
    end
  end
end
