text = "Two thousand verses is a great many - very, very great many."
puts text.length

def word_length(trimmed_text)
  (trimmed_text.map(&:length).reduce(:+) || 0) + trimmed_text.size
end

puts (if text.length > 55
        trimmed_text = []
        text.split(" ").each do | word|
          if (word_length(trimmed_text) + word.length ) < 40
            trimmed_text.push(word)
          else
            break
          end
        end
        trimmed_text.join(" ") << "... <Read More>"
      else
        text
      end)
