require 'deployml/project'

namespace :deploy do
  task :project do
    @project = DeploYML::Project.new(Dir.pwd)

    puts "Successfully loaded #{DeploYML::Project::CONFIG_FILE}"
  end

  desc 'Invokes a command on the deploy server'
  task :invoke, [:command] => :project do |t,args|
    @project.remote_sh args.command
  end

  desc 'Synches the project'
  task :sync => :project do
    puts "Syncing project from #{@project.source_uri} ..."

    @project.sync!

    puts "Project synched."
  end

  desc 'Uploads the project'
  task :upload => :project do
    puts "Uploading project to #{@project.dest_uri} ..."

    @project.upload!

    puts "Project uploaded."
  end

  desc 'Configures the server for the project'
  task :config => :project do
    puts "Configuring project at #{@project.dest_uri} ..."

    @project.config!

    puts "Project configured."
  end

  desc 'Deploys the project'
  task :push => :project do
    puts "Deploying project to #{@project.dest_uri} ..."

    @project.deploy!

    puts "Project deployed."
  end
end

task :deploy => 'deploy:push'
