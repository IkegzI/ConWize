class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    # create_table :books do |t|
    #   t.string :name
    #   t.string :description
    #   t.references :section, null: false, foreign_key: true

    #   t.timestamps
      execute <<-SQL
      CREATE  TABLE books (
        id            INTEGER PRIMARY KEY AUTOINCREMENT,
        section_id    integer,
        name          varchar(255) NOT NULL,
        description   varchar(255) NOT NULL,
        created_at    timestamp,
        updated_at    timestamp,
        FOREIGN KEY (section_id) REFERENCES sections(id)
      );
      SQL
    # end
  end
end
