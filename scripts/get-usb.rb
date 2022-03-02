def find_sdcard()
  b = `diskutil list | grep dev`.split("\n")
  puts "Insert SD card and press the any key..."
  gets.chomp
  a = `diskutil list | grep dev`.split("\n")
  [b, a, a - b]
end
