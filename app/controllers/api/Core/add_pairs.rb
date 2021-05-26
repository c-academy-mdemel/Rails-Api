require_relative 'pair'
module Api
    module Core
        class AddPairs
            def self.start(p_matrix , candidate_number)
                @pairs = []
                counter = 1;
                i = 0
                c = 0
                while  i < candidate_number
                
                    match = counter
                while match < candidate_number
                
                    if((p_matrix[i][match] > p_matrix[match][i]) )
            
                        @pairs.push(Pair.new(match, i, p_matrix[i][match],c))
                        # print p_matrix[i][match] , match , i
                        # puts " "
                        #pairs[pair_count].winner = i;
                        #pairs[pair_count].loser = match ;
                        #pair_count++;
                        

                    
                        elsif((p_matrix[i][match] < p_matrix[match][i]) )
                    
                            @pairs.push(Pair.new(i , match , p_matrix[match][i],c))
                            # print p_matrix[match][i] , i , match
                            # puts " "
                            #pairs[pair_count].winner = match;
                            #pairs[pair_count].loser = i ;
                            #pair_count++;
                        end

                        c=c+1;

                        
            
            
                    
                        
                    match += 1
                    end
            
                counter += 1
                i += 1
                end
                return @pairs
            end
        end
    end
end

