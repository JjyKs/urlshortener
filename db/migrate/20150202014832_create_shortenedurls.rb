class CreateShortenedurls < ActiveRecord::Migration
  def change
    create_table :shortenedurls do |t|
      t.string :original
      t.string :shortened

      t.timestamps
    end
  end
end
