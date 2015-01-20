require 'json'

images = Dir.glob("images/*.PNG")
data = images.map do |image_path| 
  {
    path: image_path,
    size: IO.read(image_path)[0x10..0x18].unpack('NN')
  }
end

`rm output.json` if File.exist? "output.json"

File.open("output.json", "wb") do |file|
  file.write( data.to_json.to_s )
end
