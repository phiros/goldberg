
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
end
