class String
  def demodulize_for_bm
    path = self
    if i = path.rindex('::')
      path[(i+2)..-1]
    else
      path
    end
  end
end