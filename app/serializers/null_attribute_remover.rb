module NullAttributesRemover
  def attributes
    hash = super
    hash.each do |key, value|
      hash.delete(key) if value.nil?
    end
    hash
  end
end
