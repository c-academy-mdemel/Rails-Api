module Api
    module Core
        class SortPairs
            attr_accessor :pairs_sorted
            attr_reader :pairs_sorted

            def self.start(pair_array)

                @pairs_sorted = pair_array.sort_by {|obj| obj.value}
                return @pairs_sorted

            end
        end
    end
end
