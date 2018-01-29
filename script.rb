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

def ver_aprobados(hash, nota_min = 5)
  hash.each do |key,value|
    sum = 0
    value.each do |nota|
      if nota == 'A'
        sum +=0
      else
        sum +=nota.to_i
      end
    end
    if sum.to_f/value.size >= nota_min
      puts "#{key}: Aprueba"
    else
      puts "#{key}: Reprueba"
    end
  end
end

opc = menu
while opc !=4
  case opc
  when 1
    prom_alum(hash_alum)
  when 2
    inasistencias_totales(hash_alum)
  when 3
    puts 'ingresa nota minima para aprobar(5 por defecto)'
    nota = gets.chomp.to_i
    ver_aprobados(hash_alum, nota)
  when 4
  else
    puts 'elija una opción válida'
  end
  opc = menu
end
puts 'hasta luego...'
