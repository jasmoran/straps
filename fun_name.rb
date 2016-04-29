source = File.open(ARGV[0], 'r').read
source.gsub!(/[\s\S]*section \.text/, '')
functions = source.scan(/\s(\w+):/).reverse

fun_list = []
puts "section .data"
functions.each_with_index do |(name), ix|
	puts "  fun_len_#{ix}: dq #{name.length}, #{name.length}"
	puts "              db '#{name}'"
	fun_list << name
	fun_list << "fun_len_#{ix}"
end

puts "  fun_list: dq #{fun_list.join(', ')}"

# section .data
# 	fun_len_0:	dq 11
# 	fun_0:			db 'asm_literal'
# 	fun_len_10:	dq 11
# 	fun_10:			db 'asm_literal'
# 	...
#
# 	fun_list:		dq ... asm_literal, fun_len_0
