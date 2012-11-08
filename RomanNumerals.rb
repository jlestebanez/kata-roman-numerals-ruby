#------------------------------
# CLASS RomanNumerals
#------------------------------
class RomanNumerals
	attr_accessor :romanos

	def initialize
		@romanos = Hash.new;
		@romanos[1] = { 1 => "I" , 5 => "V" }
		@romanos[2] = { 1 => "X" , 5 => "L" }
		@romanos[3] = { 1 => "C" , 5 => "D" }
		@romanos[4] = { 1 => "M" }
	end

	def traduce_a_romano numero
		digitos = numero.to_s.split("").reverse
		position = digitos.length
		resultado = ""
		digitos.length.times do
			digito = digitos[ position - 1 ].to_i
			valor = ""
			if digito == 9
				valor.concat @romanos[ position ][1]
				valor.concat @romanos[ position + 1 ][1]
			elsif digito > 5
				valor.concat @romanos[ position ][5]
				( digito - 5 ).times do valor.concat @romanos[ position ][1] end
			elsif digito > 3
				(  5  - digito).times do valor.concat @romanos[ position ][1] end
				valor.concat @romanos[ position ][5]
			else
				digito.times do valor.concat @romanos[ position ][1] end
			end
			resultado.concat valor
			position = position - 1
		end
		resultado
	end
end
