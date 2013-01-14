
Facter.add(:kernell) do
  setcode do
    require 'facter/util/config'

    if Facter::Util::Config.is_windows?
      'windows'
    else
      Facter::Util::Resolution.exec("uname -s")
    end
  end
end
