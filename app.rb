require_relative "lib/forca"

system("clear")
f = Forca.new
f.atualizar_forca

until f.fim
  puts "Digite uma letra:"
  letra = gets.chomp.upcase
  f.checar_letra(letra)
  puts ""
end

system("clear")
f.imprimir_desenho
if f.venceu
  puts f.palavra
  puts ""
  puts "Parabéns você adivinhou a palavra!"
else
  puts "Você perdeu! Tente novamente."
end