require "sinatra"
#require "sinatra/reloader" if development?

class Caesar

    def caesar_cipher(string, shift)
        
        array =[]

        alpha = ('a'..'z').to_a
        up_alpha = ('A'..'Z').to_a
        
        word = string.split('')

        word.each do |x| 
        upper = false

        if up_alpha.include?(x)
            upper = true
        end   

        x.downcase!

        index =  alpha.find_index(x)

        if index == nil # not in alpha array / not a letter
            array << x
        else
            index += shift
            if index < 25 
                if upper
                    array << alpha[index].upcase
                    
                else
                    array << alpha[index]
                end
            else
                index -= 26
                if upper
                    array << alpha[index].upcase
                else
                    array << alpha[index]
                end
            end
        end
        
    end
        return array.join('')
    end

end

get "/" do
  string = params["string"]
  offset = params["offset"]
  erb :index, :locals => {:string => string, :offset => offset}
end