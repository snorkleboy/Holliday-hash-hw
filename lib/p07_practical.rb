require_relative 'p05_hash_map'

def can_string_be_palindrome?(string) 
    counter = Hash.new{|key,val| counter[key]=0}
    string.chars.each do |char|
        counter[char]+=1
    end
    if (string.length.odd?)
        numOdd=0;
        counter.values.each do |val|
            if (val.odd?)
                numOdd+=1
            end
            if (numOdd > 1 )
                return false
            end
        end
    else
        if counter.values.any?{|val| val.odd?}
            return false
        end
    end
    true
end
