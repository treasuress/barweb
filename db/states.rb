require_relative 'cities.rb'

def create_states
  begin

    if State.all.size == 0

      #Brasil
      current_country = Country.find_by_iso("BR")
      State.create([
                       {:name => "Minas Gerais", :iso => "MG", :country => current_country}
                   ])

      puts "#{State.all.count} estado(s) criado(s)"
    end

  end
  create_cities
end

