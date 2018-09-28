def convert_hash_format(old_syntax)
  old_syntax.gsub(/:(\w+) *=>*/,'\1:')
end
