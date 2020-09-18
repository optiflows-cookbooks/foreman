module Foreman
  def random_password(size = 32, non_ambiguous = false)
    characters = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
    if non_ambiguous
      %w(I O l 0 1).each do |ambiguous_character|
        characters.delete ambiguous_character
      end
    end

    Array.new(size) do
      characters[rand(characters.size)]
    end.join
  end
end
