require_relative 'cities.rb'

def create_states
  begin

    if State.all.size == 0

      #todo now - por algum motivo, qndo chega aqui, n tem nenhum pais cadastrado
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

