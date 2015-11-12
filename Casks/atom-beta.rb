cask :v1 => 'atom-beta' do
  version '1.3.0-beta0'
  sha256 '66f468c94032740bb7b0e577e9e093939da33f87ec3bc3d1fbc4577922da78f9'

  # github.com is the official download host per the vendor homepage
  url "https://github.com/atom/atom/releases/download/v#{version}/atom-mac.zip"
  appcast 'https://github.com/atom/atom/releases.atom'
  name 'Atom Beta'
  homepage 'https://atom.io/beta'
  license :mit
  tags :vendor => 'Github'

  depends_on :macos => '>= :mountain_lion'

  app 'Atom Beta.app'
  binary 'Atom Beta.app/Contents/Resources/app/apm/node_modules/.bin/apm', :target => 'apm'
  binary 'Atom Beta.app/Contents/Resources/app/atom.sh', :target => 'atom-beta'

  postflight do
    suppress_move_to_applications
  end

  zap :delete => [
                  '~/.atom',
                  '~/Library/Application Support/ShipIt_stderr.log',
                  '~/Library/Application Support/Atom',
                  '~/Library/Application Support/ShipIt_stdout.log',
                  '~/Library/Application Support/com.github.atom.ShipIt',
                  '~/Library/Caches/com.github.atom',
                  '~/Library/Preferences/com.github.atom.plist',
                 ]
end
