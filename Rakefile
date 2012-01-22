desc "Symlink every file"
task :default do
  files = Dir.glob("*").reject { |file| file == "Rakefile" }
  current_path = File.dirname(__FILE__) + "/"

  # Print start message
  sh "echo Symlinking: #{files.join(", ")}"

  files.each do |file|
    sh "ln -vfs #{current_path}#{file} ~/.#{file}"
  end  
end
