require_relative "states.rb"

def create_countries
  begin

    if Country.all.size == 0

      Country.create([
                         {:iso => "BR", :name => "Brasil"}
                     ])
    end

  end
end

create_states