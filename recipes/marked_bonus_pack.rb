# Marked Bonus Pack installation
#
# Dependencies
# * Marked - if you haven't bought this app yet and author Markdown, you should: http://itunes.apple.com/us/app/marked/id448925439?mt=12

execute "Download the Marked Bonus Pack" do
  command "curl -L http://brettterpstra.com/downloads/MarkedBonusPack1.5.zip -o #{Chef::Config[:file_cache_path]}/MarkedBonusPack.zip"
  user WS_USER
end

execute "Unzip the Marked Bonus Pack" do
  command "cd #{Chef::Config[:file_cache_path]} && unzip -o MarkedBonusPack.zip"
  user WS_USER
end

directory "/Users/#{WS_USER}/Library/Services" do
  owner WS_USER
end

bonus_pack_dir = "#{Chef::Config[:file_cache_path]}/MarkedBonusPack1.5"
execute "Install the Marked Services" do
  command "cp -r #{bonus_pack_dir}/Services/* ~/Library/Services"
  user WS_USER
end

execute "Install the Textmate bundle if Textmate is installed" do
  command "cp -r #{bonus_pack_dir}/Textmate/Marked.tmbundle \"#{WS_HOME}/Library/Application Support/TextMate/Bundles\""
  user WS_USER
  not_if { `ls /Applications | grep TextMate`.length == 0}
end
