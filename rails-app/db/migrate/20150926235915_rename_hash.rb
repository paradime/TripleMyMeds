class RenameHash < ActiveRecord::Migration
  def change
    rename_column :healthids, :hash, :hashed_key
  end
end
