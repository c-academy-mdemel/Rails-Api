module Api
    module Core
        class LockPairs
            attr_accessor :pairs_sorted
            attr_reader :pairs_sorted



            def self.start(pairs , locked_matrix )
                @locked = locked_matrix


                edgecheck = 0 
                chaincheck = false 
                skip = false 
                i = 0
                pair_count = pairs.size
                while i < pair_count 
                
                    y = i-1
                    while y >= 0 
                    
            
            
                        if(pairs[y].loser == pairs[y+1].winner)
                        
                            chaincheck = true ;
                            
                            else
                                chaincheck = false;
                        end
            
                            if(chaincheck)
                            
                            if(pairs[y].winner == pairs[i].loser)
                            
                            skip = true ;
                            end
                        end

                            y -= 1
                        end
            
            
            
            
            
                    if (!skip)
                    
                    @locked[pairs[i].loser][pairs[i].winner] = true ;
                    end
            
                    skip = false;
                    chaincheck = false;

                    i += 1
                end

                return @locked

            end



        end
    end
end