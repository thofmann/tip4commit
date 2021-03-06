class AddProjectHost < ActiveRecord::Migration
  class Project < ActiveRecord::Base
  end

  def change
    add_column :projects, :host, :string, default: 'github'

    reversible do |dir|
      # Update all existing projects
      dir.up { Project.where(host: nil).update_all(host: 'github') }
    end
  end
end
