class CreateSections < ActiveRecord::Migration[7.0]
  def change
    # create_table :sections do |t|
      # t.integer :parent_id, default: 0
      # t.string :name

      # t.timestamps
      execute <<-SQL
      CREATE  TABLE sections (
        id            INTEGER PRIMARY KEY AUTOINCREMENT,
        parent_id     integer,
        name          varchar(255) NOT NULL,
        created_at    timestamp,
        updated_at    timestamp
      );
      
      SQL
    # end
  end
end
