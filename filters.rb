# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
    @candidates.each do |candidate|
    return candidate if  candidate[:id] == id 
    end
    # @candidates.select { |candidate| candidate[:id] == id }
    
end

def experienced?(candidate)
  candidate[:years_of_experience] >= 2 ? true : false
  
end

def github_points?(candidate)
  candidate[:github_points] >= 100
end

 def ruby_python?(candidate)
  candidate[:languages].include?("Ruby" || "Python") ? candidate : nil
end

 def date_applied?(candidate)
  (Date.today - candidate[:date_applied]).to_i <= 15 
end

def age?(candidate)
  candidate[:age] >= 18
end

#

def qualified_candidates(candidates)
result = []
candidates.each do |candidate|
  if(experienced?(candidate) && github_points?(candidate) && ruby_python?(candidate) && date_applied?(candidate) && age?(candidate))
    result.push(candidate)
  end
end
return result
end

def ordered_by_qualifications(candidates)
@candidates.sort_by { |candidate| [ candidate[:years_of_experience], candidate[:github_points] ] }.reverse
end





# More methods will go below
