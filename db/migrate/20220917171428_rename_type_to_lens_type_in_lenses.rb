class RenameTypeToLensTypeInLenses < ActiveRecord::Migration[6.1]
  def change
    rename_column :lenses, :type, :lens_type
  end
end
