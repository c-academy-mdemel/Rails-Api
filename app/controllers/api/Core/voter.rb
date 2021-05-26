module Api
    module Core
    
    class Voter
        attr_accessor :name , :choice_array
        attr_reader :name , :choice_array

        def initialize
        @name = ""
        @choice_array = Array.new
        end

        def set (num)
            @choice_array.push(num)
        end

        def get (num)
            return @choice_array[num]
        end

        def get_choice_array
            return @choice_array
        end




        end
    end
end
    