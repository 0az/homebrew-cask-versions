cask :v1 => 'tower-beta' do
  version '2.3.2-299'
  sha256 '2778bb1c98417b694bf0b72908c3d88c3b055ac959b6a1366186c0b789a2f20a'

  # amazonaws.com is the official download host per the vendor homepage
  url "https://fournova-app-updates.s3.amazonaws.com/apps/tower2-mac/299-6e9850db/Tower-2-#{version}.zip"
  appcast 'https://updates.fournova.com/updates/tower2-mac/beta'
  name 'Tower'
  homepage 'http://www.git-tower.com/'
  license :commercial

  app 'Tower.app'
  binary 'Tower.app/Contents/MacOS/gittower'

  zap :delete => [
                  '~/Library/Application Support/com.fournova.Tower2',
                  '~/Library/Caches/com.fournova.Tower2',
                  '~/Library/Preferences/com.fournova.Tower2.plist',
                 ]

  caveats do
    files_in_usr_local
  end
end
