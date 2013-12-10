# monkeypatch Sexp class with required visitor methods

class Sexp
  
  def accept(visitor)
    visitor.visit(self)
  end

  def has_child_nodes
    parent = self.kind_of?(Sexp) ? self : sexp_body
  end
  
end