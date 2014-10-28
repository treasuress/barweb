#encoding UTF-8

def create_cities
  begin

    if City.all.size == 0

    #Minas Gerais
    current_state = State.find_by_iso("MG")

    City.create([
                    {:name => "Uberlândia", :state => current_state},
                    {:name => "Uberaba", :state => current_state}
                ])

    puts "#{City.all.count} cidade(s) criada(s)"
    end

  end
end