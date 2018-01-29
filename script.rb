def read_alum(file_name)
 file = File.open(file_name, 'r')
 alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
 file.close
 alum
end

hash_alum = Hash.new
alum = read_alum("notas.csv")
alum.each do |alumno|
  key = alumno.shift
  hash_alum[key] = alumno
end

def menu
  opc = 0
  puts '1: ver alumnos y sus promedios'
  puts '2: inasistencias de cada alumno'
  puts '3: comprobar aprobados'
  puts '4: salir'
  opc = gets.chomp.to_i
end

def prom_alum(hash)
  hash.each do |key,value|
    sum = 0
    value.each do |nota|
      if nota == 'A'
        sum +=0
      else
        sum +=nota.to_i
      end
    end
    puts "#{key}: promedio = #{sum.to_f/value.size}"
  end
end

def inasistencias_totales(hash)
  hash.each do |key,value|
    inasistencia = 0
    value.each do |nota|
      if nota == 'A'
        inasistencia +=1
      end
    end
    puts "#{key}: #{inasistencia} inasistencias"
  end
end

def veraprobados(hash, nota_min = 5)
  hash.each do |key,value|
    sum = 0
    aprueba = false
    value.each do |nota|
      if nota == 'A'
        sum +=0
      else
        sum +=nota.to_i
      end
    end
    if aprueba >= nota_min
      puts "#{key}: Aprueba"
    else
      puts "#{key}: Reprueba"
    end
  end
end
