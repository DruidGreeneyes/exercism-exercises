defmodule Teenager do
	def blank?(str) do
		String.strip(str) == "" or str == ""
	end

	def yelling?(str) do
		String.to_char_list
	
  def hey(input) do
    cond do
      blank?(input)   -> "Whatever."
			yelling?(input) -> "Whoa, chill out!"
    end
  end
end
