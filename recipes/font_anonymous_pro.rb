remote_file "Download Anonymous Pro" do
  source "http://www.ms-studio.com/FontSales/AnonymousPro-1.002.zip"
  path "#{Chef::Config[:file_cache_path]}/AnonyousPro-1.002.zip"
end

execute "Unzip Anonymous Pro" do
  command "cd #{Chef::Config[:file_cache_path]} && unzip -o AnonyousPro-1.002.zip"
end

execute "Install Anonymous Pro" do
  command "cd #{Chef::Config[:file_cache_path]}/AnonymousPro-1.002.001 && cp *.ttf /Library/Fonts"
end