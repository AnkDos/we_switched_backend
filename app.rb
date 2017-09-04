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




def file_handle(name,insta_name,cat,tale)


end










get "/" do
$quote=recursive_find('quoteText',quote)
  erb:index

end

post '/form' do
  name=params[:name].to_s
  insta=params[:insta_name].to_s
  category=params[:cat].to_s
   tale=params[:Tale].to_s
    "#{name} #{insta} #{category} #{tale}"



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
