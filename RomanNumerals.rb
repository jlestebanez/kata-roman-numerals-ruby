require "rspec"
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
#------------------------------
# TESTS
#------------------------------
describe RomanNumerals do
	before :each do
		@rn = RomanNumerals.new
	end
	describe "Estructura de mspping Digitos a Romanos" do
		it "- devuelve I para [1][1]" do
			@rn.romanos[1][1].should eql "I"
		end
		it "- devuelve V para [1][5]" do
			@rn.romanos[1][5].should eql "V"
		end
		it "- devuelve X para [2][1]" do
			@rn.romanos[2][1].should eql "X"
		end
		it "- devuelve L para [2][5]" do
			@rn.romanos[2][5].should eql "L"
		end
		it "- devuelve C para [3][1]" do
			@rn.romanos[3][1].should eql "C"
		end
		it "- devuelve D para [3][5]" do
			@rn.romanos[3][5].should eql "D"
		end
		it "- devuelve M para [4][1]" do
			@rn.romanos[4][1].should eql "M"
		end
	end
	describe "Conversion de Digitos a Romanos Simples" do
		it "- devuelve I para 1" do
			@rn.traduce_a_romano(1).should eql "I"
		end
		it "- devuelve D para 500" do
			@rn.traduce_a_romano(500).should eql "D"
		end
		it "- devuelve MDLI para 1551" do
			@rn.traduce_a_romano(1551).should eql "MDLI"
		end
	end
	describe "Conversion de Digitos a Romanos Complejos" do
		it "- devuelve III para 3" do
			@rn.traduce_a_romano(3).should eql "III"
		end
		it "- devuelve IV para 4" do
			@rn.traduce_a_romano(4).should eql "IV"
		end
		it "- devuelve VII para 7" do
			@rn.traduce_a_romano(7).should eql "VII"
		end
		it "- devuelve IX para 9" do
			@rn.traduce_a_romano(9).should eql "IX"
		end
		it "- devuelve DIX para 509" do
			@rn.traduce_a_romano(509).should eql "DIX"
		end
	end
	describe "Conversion de Digitos a Romanos Complejos Ejemplos" do
		it "- devuelve MCMXC para 1990" do
			@rn.traduce_a_romano(1990).should eql "MCMXC"
		end
		it "- devuelve MMVIII para 2008" do
			@rn.traduce_a_romano(2008).should eql "MMVIII"
		end
		it "- devuelve MCMXCIX para 1999" do
			@rn.traduce_a_romano(1999).should eql "MCMXCIX"
		end
	end
end
