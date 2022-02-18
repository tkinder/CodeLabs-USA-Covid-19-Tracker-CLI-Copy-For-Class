module Printable
    module Styles
        def text_to_integer(text)
            text == "" ? output = 0 : output = text.gsub(/[\s,"\n"]/,"").to_i
            output
        end
    end
end