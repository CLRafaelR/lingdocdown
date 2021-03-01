function Div (elem)
  if FORMAT:match 'docx' then
    if elem.classes[1] then
      elem.attributes['custom-style'] = elem.classes[1]
      return elem
    else
      return elem
    end
  elseif FORMAT:match 'latex' then
    if elem.classes[1] then
      local box = "\\begin{tcolorbox}[colframe=" .. elem.classes[1] .. "-frame, colback=" .. elem.classes[1] .. "-bg]"
      return{
        pandoc.RawBlock('latex', box),
        elem,
        pandoc.RawBlock('latex', '\\end{tcolorbox}')
      }
    else
      return elem
    end
  end
end
