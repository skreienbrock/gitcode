class Wikimaker
  attr_accessor :counter, :items
  # Table definition functions
  def print_tableheader
    # code placeholder
    puts "tableheader wiki"
  end
  def print_tabletopics
    # code placeholder
    puts "tabletopics"
  end
  def print_tablefield
    # code placeholder
    self.items += 1
    puts "tablefield" + self.items.to_s
  end
  def print_tablefooter
    # code placeholder
    puts "tablefooter"
  end
end
