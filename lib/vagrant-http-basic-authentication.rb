require 'io/console'

$stdout.sync = true
$stdin.sync = true

module VagrantPlugins
  module HttpBasicAuthentication
    class HttpBasicAuthentication < Vagrant.plugin("2")
      name 'HttpBasicAuthentication'
    end
  end
end

class String
  def with_basic_authentication
    self.define_singleton_method(:to_s) do
      u = self.split("://")
      $stdout.puts "#{self} needs authentication"
      $stdout.print "login: "
      user = $stdin.gets.chomp
      $stdout.print "password: "
      password = $stdin.noecho(&:gets).chomp
      "#{u[0]}://#{user}:#{password}@#{u[1]}"
    end
    self
  end
end