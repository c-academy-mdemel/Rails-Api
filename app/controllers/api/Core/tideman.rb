require_relative 'voter'
require_relative 'mark_preferences'
require_relative 'add_pairs'
require_relative 'sort_pairs'
require_relative 'lock_pairs'
require_relative 'pair'

module Api
  module Core

    class Tideman

      def calculate(cc,vc,vs)
        @candidate_count = cc
        @preferences = Array.new(@candidate_count) { Array.new(@candidate_count) { 0 } }
        arrow_lock = Array.new(@candidate_count) { Array.new(@candidate_count) { false } }
        @pairs = [];

        voter_count = vc

        matrix_mark_object = MarkPreferences.new(@candidate_count)
        voters = Array.new(voter_count){Voter.new}


        i = 0
        z = 0

        while i < voter_count 

              
          

          voters[i]::name = vs[i]["name"]

          while z < @candidate_count
            # puts " Candidate #{z} :"
            input =  vs[i]["votes"][z]
            voters[i]::set(input)
            z += 1
          end


          current_voter_choice_array = voters[i]::get_choice_array
          @detailed_preferences = matrix_mark_object.mark_matrix(current_voter_choice_array)
        
          z = 0
          i += 1
        end
          
        

        detailed_preferences = JSON.parse(@detailed_preferences.to_json);
        @preferences = detailed_preferences["preference_matrix"];

        @pairs = AddPairs.start(@preferences , @candidate_count)


        @sorted_pairs = SortPairs.start(@pairs)



        arrow_lock = LockPairs.start(@sorted_pairs.reverse , arrow_lock)

        arrow_lock.each do |r|

          puts r.each { |p| p }.join(" ")
        # sleep(0.5)
        end
        
        find_lock_array = Array.new(@candidate_count , false) 

        winner_index = arrow_lock.find_index(find_lock_array) 

        return {intermediates: detailed_preferences["intermediate"],pairs: @pairs,sorted: @sorted_pairs,arrow_lock: arrow_lock};


      end
    end
  end
end












 



