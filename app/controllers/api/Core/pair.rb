
module Api
    module Core
        class Pair
            attr_accessor :winner , :loser , :value
            attr_reader :winner , :loser , :value

            def initialize(a, b ,c,d)
            @winner = a
            @loser =  b
            @value =  c
            @id    =  d
            end



        end
    end
end