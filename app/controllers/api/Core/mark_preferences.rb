module Api
  module Core

    class MarkPreferences
      attr_accessor :preference_matrix, :candidate_number , :intermediate_array
      attr_reader :preference_matrix , :candidate_number , :intermediate_array




      def initialize(candidate_number)
      @candidate_number = candidate_number.to_i
      @preference_matrix = Array.new(candidate_number) { Array.new(candidate_number) { 0 } }
      @intermediate_array = []
      end

      def mark_matrix(choice_array)
          mm=0
          index_counter = 1;
          intermediate = []
            while mm < @candidate_number 
            
              match = index_counter
              while match < @candidate_number 
              
                  @preference_matrix[choice_array[match]][choice_array[mm]] +=1 
                  matrix_position =Marshal.load(Marshal.dump(@preference_matrix))
                  intermediate.push matrix_position;
                  match +=1
                end
        
              index_counter += 1
              mm += 1
            end

            @intermediate_array.push(JSON.parse({current_vote: choice_array,intermediate: intermediate}.to_json));
            return {preference_matrix: @preference_matrix, intermediate:  @intermediate_array}
            
      end

      end
    end
  end