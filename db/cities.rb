#encoding UTF-8

def create_cities
  begin

    if City.all.size == 0

    #Minas Gerais
    current_state = State.find_by_iso("MG")

    #todo now - algum otro prog - n está gravando estado - tem tabela de estado - ver esse state_id
    City.create([
                    {:name => "Uberlândia", :state => current_state},
                    {:name => "Uberaba", :state => current_state}
                ])

    end

  end
end