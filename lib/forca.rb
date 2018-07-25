class Forca
  attr_reader :palavra
  attr_accessor :letras, :banco, :fim, :venceu, :vidas

  PALAVRAS = [
    "Copo",
    "Colar",
    "Quadro",
    "Computador",
    "Teclado",
    "Escola",
    "Livro",
    "Chave",
    "Papel",
    "Homem",
    "Jogo"
  ]

  def initialize
    @fim = false
    @venceu = false
    @palavra = PALAVRAS.sample.upcase
    @letras_acertadas = []
    @letras_erradas = []
    @vidas = 6
  end

  def checar_letra(letra)
    if @palavra.include? letra
      @letras_acertadas.push(letra)
      atualizar_forca
      puts "A letra existe!"
      true
    else
      unless @letras_erradas.include? letra
        @letras_erradas.push(letra)
        @vidas -= 1
        @fim = true if @vidas == 0
      end
      atualizar_forca
      puts "A letra não existe!"
      false
    end
  end

  def atualizar_forca
    system("clear")
    imprimir_desenho
    puts preencher_forca
    puts "Letras erradas: #{@letras_erradas.sort.join(', ')}" if @letras_erradas.size > 0
    puts ""
  end

  def imprimir_desenho
    File.open(File.expand_path("../../ascii/#{@vidas}.txt", __FILE__), 'r') do |arq|
      while line = arq.gets
        puts line
      end
    end
    puts ""  
  end

  def preencher_forca
    resultado = []
    letras_da_palavra = @palavra.split("")
    letras_da_palavra.each do |l|
      @letras_acertadas.include?(l) ? resultado.push(l) : resultado.push("_")
    end
    unless resultado.include? "_"
      @fim = true
      @venceu = true
    end
    resultado.join
  end
end