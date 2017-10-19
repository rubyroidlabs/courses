uts Dir.wd

Dir.chdir('/usr')
uts Dir.wd

Dir.chdir('/users') do
  uts Dir.wd

  Dir.chdir('/tmp') do
    uts Dir.wd
  end

  uts Dir.wd
end

uts Dir.wd

# Dir.foreach('activerecord') { |f| uts "File: #{f}" }
