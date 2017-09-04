require "sinatra"
require 'net/http'
require 'json'



 def quote
   url="http://api.forismatic.com/api/1.0/?method=getQuote&key=457653&format=json&lang=en"
   uri = URI(url)
   response = Net::HTTP.get(uri)
   d=JSON.parse(response)
   return d
end

def recursive_find( key, object )
  case object
  when Array
    object.each do |el|
      if el.is_a?(Hash) || el.is_a?(Array)
        res = recursive_find( key, el )
        return res if res
      end
    end
  when Hash
    return object[key] if object.has_key?( key )
    object.each do |k,v|
      if v.is_a?(Hash) || v.is_a?(Array)
        res = recursive_find( key, v )
        return res if res
      end
    end
  end
  nil
end














get "/" do
$quote=recursive_find('quoteText',quote)
  erb:index

end

post '/form' do
#
File.open('wsws.txt', 'a+') do |f|
    f.puts "Name:  #{params[:name].to_s}"
    f.puts "Insta Name:  #{params[:insta_name].to_s}"
    f.puts "Category: #{params[:cat].to_s}"
    f.puts "Story:  #{params[:Tale].to_s}"
    f.puts "date and time: #{Time.now}"
    f.puts " "
  end
erb:index
end

get '/aven' do
send_file ('wsws.txt')
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
