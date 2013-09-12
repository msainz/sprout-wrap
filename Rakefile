
task :env do
  require 'chef'
  Chef::Config[:solo] = true
end

task :key => :env do
  require 'chef/encrypted_data_bag_item'
  $key = Chef::EncryptedDataBagItem.load_secret('.private_data_bags_key')
end

namespace :generate do
  desc 'generate .private_data_bags_key'
  task :key do
    unless File.exist?('.private_data_bags_key')
      sh "openssl rand -base64 2048 | tr -d '\\r\\n' > .private_data_bags_key"
    else
      puts '.private_data_bags_key already exists!'
    end
  end
end

desc 'encrypt private data bag items (private/*.json.decrypted)'
task :encrypt => :key do
  Dir.glob(File.join(Chef::Config[:data_bag_path], 'private', '*.json.decrypted')).map do |filename|
    decrypted = JSON.load( File.open(filename).read )
    encrypted = Chef::EncryptedDataBagItem.encrypt_data_bag_item(decrypted, $key)
    target = filename.gsub(/\.decrypted$/,'')
    File.open(target, 'w') { |f| f.write encrypted.to_json }
    puts "Wrote #{target}"
  end
end

desc 'decrypt private data bag items (private/*.json)'
task :decrypt => :key do
  Dir.glob(File.join(Chef::Config[:data_bag_path], 'private', '*.json')).map do |filename|
    name = File.basename(filename, '.json')
    bag = Chef::EncryptedDataBagItem.load('private', name, $key)
    target = filename+'.decrypted'
    File.open(target, 'w') { |f| f.write bag.to_hash.to_json }
    puts "Wrote #{target}"
  end
end

desc 'remove decrypted private data bag items (private/*.decrypted)'
task :clean => :key do
  sh 'rm data_bags/private/*.decrypted'
end
