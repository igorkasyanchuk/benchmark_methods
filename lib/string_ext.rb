module StringExt
  refine String do
    def demodulize
      path = self
      if i = path.rindex('::')
        path[(i+2)..-1]
      else
        path
      end
    end
  end
end