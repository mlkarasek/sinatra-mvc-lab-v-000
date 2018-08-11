class PigLatinizer

    attr_accessor :text

    def piglatinize(text)
        @text = text
        self.pig_latinize_it
    end

    def split_text
        @text.split(" ")
    end

    def pig_latinize_it
        new_sentence = []

        split_text.each do |word|
            if word.split('').first.match(/[AEIOUaeiou]/)
                new_word = word + 'way'
                new_sentence << new_word
            else
                split_w = word.split /([[aeiou]|[AEIOU]].*)/
                shift_w = split_w.insert(1,split_w.delete_at(0))
                shift_w.push("ay")
                joined_w = shift_w.join
                new_sentence << joined_w
            end
        end

        new_sentence.join(" ")
    end

    def display_text
        @text.reverse
    end

end
