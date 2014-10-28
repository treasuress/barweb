require_relative "states.rb"

def create_countries
  begin

    if Country.all.size == 0

      Country.create([
                         {:name => "Brasil", :iso => "BR"}
                     ])

      puts "#{Country.all.count} pais(es) criado(s)"
    end

  end
  create_states
end

