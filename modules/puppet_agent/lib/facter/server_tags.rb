
File.open('/tmp/camtesta', 'w') { |file| file.write("the code before the facter add was called." )}

Facter.add(:kernell) do

  File.open('/tmp/camtestb', 'w') { |file| file.write("the code in the facter add and before setcode was called." )}

  setcode do
    File.open('/tmp/camtestc', 'w') { |file| file.write("the code in setcode was called." )}
    require 'facter/util/config'

    if Facter::Util::Config.is_windows?
      'windows'
    else
      Facter::Util::Resolution.exec("uname -s")
    end
  end
end
