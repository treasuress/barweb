#encoding UTF-8

def create_cities
  begin

    if City.all.size == 0

    #Minas Gerais
    current_state = State.find_by_iso("MG")

    City.create([
                    {:name => "Uberlândia", :state_id => current_state},
                    {:name => "Uberaba", :state_id => current_state}
                ])

    end

  end
end