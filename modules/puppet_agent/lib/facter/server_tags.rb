require 'facter'

Facter.add(:server_tags) do
  setcode do
    Facter::Util::Resolution.exec("cat /etc/puppet/server_tags 2>/dev/null")
  end
end