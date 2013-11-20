require_relative 'cities.rb'

def create_states
  begin

    if State.all.size == 0

      #Brasil
      current_Country = Country.find_by_iso("BR")

      State.create([
                       {:iso => "MG", :name => "Minas Gerais", :country_id => current_Country}
                   ])
    end

  end
end

create_cities