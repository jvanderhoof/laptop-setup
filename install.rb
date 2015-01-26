brew_libraries = [
  'git',
  'awscli',
  'zsh',
  'mysql',
  'aspell',
  'imagemagick --with-libtiff',
  'freeimage',
  'memcached',
  'redis',
  'sphinx --mysql',
  'packer',
  'postgres',
  'fig'
]

cask_libraries = [
  'sublime-text',
  'iterm2',
  'alfred',
  'google-chrome',
  'hipchat',
  'sequel-pro',
  'libreoffice',
  'virtualbox',
  'vagrant',
  'skype',
  'spotify',
  'chefdk',
  'postgres',
  'flux',
  'cyberduck',
  'heroku-toolbelt',
  'psequel',
  'boot2docker'
]

vagrant_plugins = [
  'vagrant-berkshelf',
  'vagrant-omnibus',
  'vagrant-cachier'
]

$stdout.sync = true
def install(arg)
  IO.popen(arg) do |data|
    while line = data.gets
      puts line
    end
  end
  puts
end

def v_install(args)
  install "vagrant plugin install #{args}"
end

def b_install(args)
  install "brew install #{args}"
end

def c_install(args)
  install "brew cask install #{args}"
end
=begin
puts "install homebrew"
system("ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\"")

install 'brew doctor'
install 'brew tap caskroom/cask'
install 'brew tap homebrew/binary'

b_install 'brew-cask'

brew_libraries.each{|item| b_install(item)}

install "mkdir -p ~/Library/LaunchAgents"
%w{postgresql redis memcached mysql}.each do |app|
  install "ln -sfv /usr/local/opt/#{app}/*.plist ~/Library/LaunchAgents/"
  install "launchctl load ~/Library/LaunchAgents/homebrew.mxcl.#{app}.plist"
  install "createdb" if app == 'postgresql'
end

cask_libraries.each{|item| c_install(item) }

vagrant_plugins.each{|item| v_install(item) }

puts 'install rvm & rubies'
install '\curl -L https://get.rvm.io | bash -s stable --ruby'

=end
system "source ./.rvm/scripts/rvm"

%w{ 1.9.3 1.8.7 2.2 }.each do |ruby_version|
  ruby = "ruby-#{ruby_version}"
  next if system("rvm list | grep #{ruby}")
  install "rvm install #{ruby} --with-gcc=clang"
  unless ruby.match(/1\.8\.7/)
    install "rvm #{ruby} do gem update --system"
  else
    install "rvm #{ruby} do gem update --system 1.8.25"
  end
end

install "curl -L http://install.ohmyz.sh | sh"

#install 'ssh-keygen -t rsa'
#puts "Paste this key into your github account: #{`cat ~/.ssh/id_rsa.pub`}"