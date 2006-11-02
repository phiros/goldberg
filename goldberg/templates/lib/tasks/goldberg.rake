
namespace :goldberg do

  desc "Dump standard Goldberg tables to files in db/"
  task :dump_starter => :environment do
    goldberg_classes.each do |klass|
      dump_for_class klass, "db"
    end
  end

  desc "Load standard Goldberg tables from files in db/"
  task :load_starter => :environment do
    goldberg_classes.each do |klass|
      load_for_class klass, "db"
    end
  end

  desc "Set up a legacy Goldberg database for migrations"
  task :migrate_legacy => :environment do
    puts "Setting up schema_info"
    ActiveRecord::Base.transaction do
      ActiveRecord::Schema.create_table "schema_info", :id => false do |t|
        t.column "version", :integer
      end
      ActiveRecord::Migration.execute <<-END
insert into schema_info (version)
values (1)
END
    end
  end

  desc "Flush cached data out of sessions and Roles"
  task :flush => :environment do
    puts "Deleting any Rails session files"
    Dir["#{RAILS_ROOT}/tmp/sessions/ruby_sess*"].each do |fname|
      File.delete fname
    end
    
    puts "Deleting any ActiveRecord sessions, and resetting the Role cache"
    conn = ActiveRecord::Base.connection
    conn.execute "delete from sessions"
    conn.execute "update roles set cache = NULL"
  end

  desc "Upgrade a legacy Goldberg database to the latest version"
  task :upgrade => [:flush, :migrate_legacy] do
  end

end


def goldberg_classes
  return [ Permission, Role, RolesPermission, User,
           SiteController, ControllerAction,
           MarkupStyle, ContentPage,
           MenuItem, SystemSettings ]
end

def dump_for_class(klass, dest)
  filename = "#{dest}/#{klass.to_s}.yml"
  records = klass.find(:all)
  File.open(filename, 'w') do |out|  
    YAML.dump(records, out)
  end
end

def load_for_class(klass, src)
  filename = "#{src}/#{klass.to_s}.yml"
  File.open(filename) do |src|
    records = YAML::load(src)
    records.each do |src_rec|
      record = klass.new src_rec.attributes
      record.id = src_rec.id
      record.save or 
        puts "#{klass.to_s} record #{record} not saved!"
    end
  end
  # Reset table sequence if applicable (i.e. PostgreSQL)
  if klass.connection.respond_to?(:reset_pk_sequence!)
    klass.connection.reset_pk_sequence!(klass.table_name)
  end
end

