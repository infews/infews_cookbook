ruby_block "Dropbox Backgrounds" do
  block do
    require 'plist'

    def plist_path
      "#{ENV['HOME']}/Library/Preferences/com.apple.desktop.plist"
    end

    def plist_to_hash
      if File.exists?(plist_path)
        `plutil -convert xml1 #{plist_path}`
        Plist::parse_xml(plist_path)
      else
        Plist::parse_xml('<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"><plist version="1.0"><dict></dict></plist>')
      end
    end

    def rotate_backgrounds_from(pictures_path, time_in_seconds)
      {
          "default" =>
              {
                  "BackgroundColor" =>
                      [0.0, 0.250980406999588, 0.501960813999176],
                  "Change" => "TimeInterval",
                  "ChangePath" => pictures_path,
                  "ChangeTime" => time_in_seconds,
                  "DSKDesktopPrefPane" => {
                      "UserFolderPaths" => [
                          pictures_path
                      ]
                  },
                  "DrawBackgroundColor" => true,
                  "LastName" => Dir.glob(pictures_path).first,
                  "NewChangePath" => pictures_path,
                  "NoImage" => false,
                  "Placement" => "Crop",
                  "Random" => true,
              }
      }
    end

    Gem.clear_paths

    desktop_plist = plist_to_hash
    desktop_plist["Background"] = rotate_backgrounds_from("/Users/#{WS_USER}/Dropbox/Photos/Desktop", 1800)

    File.open(plist_path, "w") do |f|
      f << Plist::Emit.dump(desktop_plist)
    end

    `killall Dock`
  end
end