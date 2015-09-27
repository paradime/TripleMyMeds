class ChangePhotoToAllowNull < ActiveRecord::Migration
  def change
    change_column :healthids, :photo, :integer, :null => true
  end
end
