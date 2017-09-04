require "sinatra"
require 'net/http'
require 'json'



















 def quote
   url="http://api.forismatic.com/api/1.0/?method=getQuote&key=457653&format=json&lang=en"
   uri = URI(url)
   response = Net::HTTP.get(uri)
   d=JSON.parse(response)
end

get "/" do
  erb:index
end



#
# puts "Chose Option :"
# puts "1. Cipher"
# puts "2.De Cipher"
# op=Integer(gets)
# if op==1
# puts "Enter Text to Cipher:"
# str="AnkurPandey"
# obj.encode(str)
# end
#
# if op==2
# puts "Enter Text to Decipher:"
# str=String(gets)
# obj.decode(str)
# end
